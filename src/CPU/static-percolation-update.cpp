#include <bits/stdc++.h>
#include <omp.h>
#include <chrono>
using namespace std;

// compile : g++ -O3 -fopenmp -static-libstdc++ <file_name>.cpp -o computePC-static-percUpdate

const int INF = 1e9;
int numthreads = 48;

int N, M;
vector<vector<int>> adj;
vector<int> query_node;
vector<double> percolation, x, updated_x, contrib;
vector<pair<double, int>> perc;
vector<double> test_percolation;

void brandes(int src, vector<double> &x, vector<vector<int>> &adj, double *ptr)
{
	int N = (int)x.size() - 1;
	queue<int> q;
	stack<int> st;
	vector<int> dist(N + 1, -1);
	vector<double> sig(N + 1, 0.0), delta(N + 1, 0.0);
	vector<vector<int>> pr(N + 1);

	int u = src;
	q.push(u);
	dist[u] = 0;
	sig[u] = 1.0;

	while (!q.empty())
	{
		u = q.front();
		q.pop();
		st.push(u);

		for (auto v : adj[u])
		{
			if (dist[v] < 0)
			{
				dist[v] = dist[u] + 1;
				q.push(v);
			}
			if (dist[v] == dist[u] + 1)
			{
				pr[v].push_back(u);
				sig[v] = sig[u] + sig[v];
			}
		}
	}

	while (!(st.empty()))
	{
		u = st.top();
		st.pop();
		for (auto p : pr[u])
		{
			double g = sig[p] / sig[u];
			g = g * (max(x[src] - x[u], (double)(0.0)) + delta[u]);
			delta[p] = delta[p] + g;
		}
		if (u != src)
			ptr[u] += delta[u];
		pr[u].clear();
		delta[u] = 0;
		sig[u] = 0;
		dist[u] = -1;
	}
}

int main(int argc, char **argv)
{
	ios::sync_with_stdio(false);
	cin.tie(0);
	cout.tie(0);

	string input = argv[1];
	string queries = argv[2];
	string output = argv[3];
	string numthread_string = argv[4];
	numthreads = atoi(argv[4]);

	omp_set_num_threads(numthreads);
	ifstream fin(input);
	ofstream fout(output);

	size_t last_slash_pos = input.find_last_of('/');
    size_t last_dot_pos = input.find_last_of('.');
    string dataset_name = "unknown_dataset";
    if (last_slash_pos != string::npos && last_dot_pos != string::npos && last_dot_pos > last_slash_pos) {
        dataset_name = input.substr(last_slash_pos + 1, last_dot_pos - last_slash_pos - 1);
    } else if (last_dot_pos != string::npos) { // Handle cases where there's no slash
        dataset_name = input.substr(0, last_dot_pos);
    } else { // Handle cases where there's no dot or slash
        dataset_name = input;
    }


    // Extract query size from queries path
    string query_size_str = "unknown_query_size";
    size_t queries_pos = queries.find("queries_");
    if (queries_pos != string::npos) {
        size_t next_slash_pos = queries.find('/', queries_pos);
        if (next_slash_pos != string::npos) {
            query_size_str = queries.substr(queries_pos + 8, next_slash_pos - (queries_pos + 8));
        } else { // Handle if queries_ is at the end or followed by something else without '/'
            query_size_str = queries.substr(queries_pos + 8);
        }
    }


    cerr << dataset_name << ","; // Print extracted dataset name
    cerr << query_size_str << ","; // Print extracted query size
    cerr << numthreads << ",";
	cerr << "SPU-CPU,";

	fin >> N >> M;

	cerr << N << "," << M << ",";
	int u, v;
	adj.resize(N + 1);
	x.push_back(0);
	for (int i = 0; i < N; ++i)
	{
		double prc = 1.0 / (double)(i + 1);
		x.push_back(prc);
	}
	for (int i = 0; i < M; ++i)
	{
		fin >> u >> v;
		adj[u].push_back(v);
		adj[v].push_back(u);
	}

	perc.resize(N + 1);
	contrib.resize(N + 1);
	updated_x.resize(N + 1);
	percolation.resize(N + 1, 0);
	test_percolation.resize(N + 1, 0);

	auto t1 = std::chrono::high_resolution_clock::now();

	for (int i = 1; i <= N; ++i)
		perc[i] = {x[i], i};
	sort(perc.begin(), perc.end());
	double carry = 0, sum_x = 0;
	for (int i = 1; i <= N; ++i)
	{
		contrib[perc[i].second] = (double)(i - 1) * perc[i].first - carry;
		carry += perc[i].first;
		sum_x += contrib[perc[i].second];
	}
	carry = 0;
	for (int i = N; i >= 1; i--)
	{
		contrib[perc[i].second] += carry - (double)(N - i) * perc[i].first;
		carry += perc[i].first;
	}

	double *ptr = &percolation[0];
#pragma omp parallel for reduction(+ : ptr[ : N + 1])
	for (int i = 1; i <= N; ++i)
		brandes(i, x, adj, ptr);

	auto t2 = std::chrono::high_resolution_clock::now();

	auto duration = std::chrono::duration_cast<std::chrono::microseconds>(t2 - t1).count();
	// cerr << "Initial Static Computation time : " << duration << " mu.s." << endl;

	cout << duration << ",";
	duration = 0;
	auto duration_actual = duration;

	ifstream qin(queries);
	int batch_size;
	while (qin >> batch_size)
	{
		updated_x = x;
		int node;
		double val;
		for (int i = 1; i <= batch_size; ++i)
		{
			qin >> node >> val;
			if (x[node] != val)
				updated_x[node] = val;
		}
		x = updated_x;

		auto t3 = std::chrono::high_resolution_clock::now();
		fill(percolation.begin(), percolation.end(), 0);
		ptr = &percolation[0];
#pragma omp parallel for reduction(+ : ptr[ : N + 1])
		for (int i = 1; i <= N; ++i)
			brandes(i, x, adj, ptr);
		auto t4 = std::chrono::high_resolution_clock::now();
		duration_actual += std::chrono::duration_cast<std::chrono::microseconds>(t4 - t3).count();
		// for (int i = 1; i <= N; ++i)
		// 	fout << percolation[i] / (sum_x - contrib[i]) << " ";
		// fout << "\n";
	}
	// cerr << "Total time for updates : " << duration_actual << " mu.s." << endl;
	cerr << duration_actual << endl;

	// 	fill(test_percolation.begin(), test_percolation.end(), 0);
	// 	ptr = &test_percolation[0];
	// #pragma omp parallel for reduction(+ : ptr[ : N + 1])
	// 	for (int i = 1; i <= N; ++i)
	// 		brandes(i, x, adj, ptr);
	// 	double max_diff = 0;
	// 	for (int i = 1; i <= N; ++i)
	// 		max_diff = max(max_diff, abs(percolation[i] - test_percolation[i]) / (sum_x - contrib[i]));
	// 	cerr << "Max difference in PC point-wise : " << max_diff << "\n";

	return 0;
}