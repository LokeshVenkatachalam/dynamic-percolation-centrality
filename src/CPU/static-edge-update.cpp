#include <bits/stdc++.h>
#include <omp.h>
#include <chrono>
using namespace std;

// compile : g++ -O3 -fopenmp -static-libstdc++ <file_name>.cpp -o computePC-static-edgeUpdate
int numthreads = 48;
const int INF = 1e9;

int N, M;
vector<vector<int>> adj;
vector<int> query_node;
vector<double> percolation, x, updated_x, contrib, global_pc;
vector<pair<double, int>> perc;
vector<double> test_percolation;

void printProfileStats(const vector<vector<long long>> &profile1)
{
	// Assuming profile1 is indexed from 1 to N.
	int N = profile1.size() - 1;
	if (N < 1)
		return;
	int numCols = profile1[1].size();

	vector<double> sum(numCols, 0.0);
	vector<double> sumSq(numCols, 0.0);
	vector<double> minVal(numCols, numeric_limits<double>::max());
	vector<double> maxVal(numCols, numeric_limits<double>::lowest());

	// For trend: we need the sums of row indices.
	double sumI = 0;
	double sumISq = 0;
	for (int i = 1; i <= N; ++i)
	{
		sumI += i;
		sumISq += i * i;
		for (int j = 0; j < numCols; ++j)
		{
			double val = profile1[i][j];
			sum[j] += val;
			sumSq[j] += val * val;
			if (val < minVal[j])
				minVal[j] = val;
			if (val > maxVal[j])
				maxVal[j] = val;
		}
	}
	// Set fixed format with four decimal places.
	cout << fixed << setprecision(4);

	// Process each column
	for (int j = 0; j < numCols; ++j)
	{
		double avg = sum[j] / N;
		double variance = (sumSq[j] / N) - (avg * avg);
		// Calculate trend (slope) using least squares.
		double sumXY = 0;
		for (int i = 1; i <= N; ++i)
		{
			sumXY += i * profile1[i][j];
		}
		double slope = (N * sumXY - sumI * sum[j]) / (N * sumISq - sumI * sumI);

		cout << "Column " << j << " stats:" << endl;
		cout << "  Average : " << avg << endl;
		cout << "  Variance: " << variance << endl;
		cout << "  Sum : " << sum[j] << endl;
		cout << "  Minimum : " << minVal[j] << endl;
		cout << "  Maximum : " << maxVal[j] << endl;
		cout << "  Trend (slope): " << slope << endl;
		cout << "------------------------" << endl;
	}
}

void printHistogramForColumn(const vector<vector<long long>> &profile, int colIndex, int numBins = 10)
{
	// Collect values from profile (assumes row 0 is unused).
	vector<double> values;
	for (size_t i = 1; i < profile.size(); ++i)
	{
		if (colIndex < profile[i].size())
		{
			values.push_back(profile[i][colIndex]);
		}
	}
	if (values.empty())
	{
		cout << "No data in column " << colIndex << endl;
		return;
	}

	// Determine min and max
	double minVal = *min_element(values.begin(), values.end());
	double maxVal = *max_element(values.begin(), values.end());

	// Avoid zero range
	if (minVal == maxVal)
	{
		cout << "All values are equal (" << minVal << ")." << endl;
		return;
	}

	double range = maxVal - minVal;
	double binSize = range / numBins;
	vector<int> bins(numBins, 0);

	// Count frequency into bins.
	for (double v : values)
	{
		// Special case for the max value.
		int bin = (v == maxVal) ? numBins - 1 : static_cast<int>((v - minVal) / binSize);
		if (bin < 0)
			bin = 0;
		else if (bin >= numBins)
			bin = numBins - 1;
		bins[bin]++;
	}

	// Print histogram results.
	cout << "Histogram for column " << colIndex << ":\n";
	for (int i = 0; i < numBins; ++i)
	{
		double lower = minVal + i * binSize;
		double upper = lower + binSize;
		cout << "[" << fixed << setprecision(2) << lower << ", " << upper << "): " << bins[i] << endl;
	}
}
void brandes(int src, vector<double> &x, vector<vector<int>> &adj, double *ptr, vector<vector<long long>> &profile, bool sub = false)
{
	auto p1 = std::chrono::high_resolution_clock::now();
	int N = (int)x.size() - 1;
	queue<int> q;
	stack<int> st;
	vector<int> dist(N + 1, -1);
	vector<double> sig(N + 1, 0.0), delta(N + 1, 0.0);
	vector<vector<int>> pr(N + 1);
	auto p2 = std::chrono::high_resolution_clock::now();

	int u = src;
	q.push(u);
	dist[u] = 0;
	sig[u] = 1.0;
	auto p3 = std::chrono::high_resolution_clock::now();
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
				sig[v] += sig[u];
			}
		}
	}
	auto p4 = std::chrono::high_resolution_clock::now();
	while (!(st.empty()))
	{
		u = st.top();
		st.pop();
		for (auto p : pr[u])
		{
			double g = sig[p] / sig[u];
			// changed from max(x[src]-x[u], 0.0) to this
			g = g * (x[src] - x[u] + delta[u]);
			delta[p] = delta[p] + g;
		}
		if (u != src)
		{
			if (sub)
			{
				ptr[u] -= delta[u];
			}
			else
			{
				ptr[u] += delta[u];
			}
		}
		pr[u].clear();
		delta[u] = 0;
		sig[u] = 0;
		dist[u] = -1;
	}
	auto p5 = std::chrono::high_resolution_clock::now();
	profile[src][0] = std::chrono::duration_cast<std::chrono::microseconds>(p2 - p1).count();
	profile[src][1] = std::chrono::duration_cast<std::chrono::microseconds>(p3 - p2).count();
	profile[src][2] = std::chrono::duration_cast<std::chrono::microseconds>(p4 - p3).count();
	profile[src][3] = std::chrono::duration_cast<std::chrono::microseconds>(p5 - p4).count();
}

void get_dist_array(int src, vector<vector<int>> &adj, vector<int> &dist)
{
	queue<int> q;
	dist[src] = 0;
	q.push(src);
	while (!q.empty())
	{
		int u = q.front();
		q.pop();
		for (int v : adj[u])
		{
			if (dist[v] != -1)
				continue;
			dist[v] = dist[u] + 1;
			q.push(v);
		}
	}
}

// void get_affected_vertices(vector<vector<int>> &adj, vector<pair<int, int>> &edge_batch, vector<int> &affected)
// {
// 	int *mtr = &affected[0];
// #pragma omp parallel for reduction(+ : mtr[ : N + 1])
// 	for (int j = 0; j < (int)edge_batch.size(); ++j)
// 	{
// 		vector<int> epDistance1(N + 1, -1), epDistance2(N + 1, -1);
// 		auto e = edge_batch[j];
// 		int u = e.first;
// 		int v = e.second;
// 		get_dist_array(u, adj, epDistance1);
// 		get_dist_array(v, adj, epDistance2);
// 		for (int i = 1; i <= N; i++)
// 		{
// 			if (epDistance1[i] != epDistance2[i])
// 			{
// 				mtr[i]++;
// 			}
// 		}
// 	}
// }

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

	cerr << input << ",";
	cerr << numthreads << ",";

	fin >> N >> M;
	int u, v;
	adj.resize(N + 1);
	vector<vector<long long>> profile1(N + 1, vector<long long>(5, 0));
	vector<vector<long long>> profile2(N + 1, vector<long long>(5, 0));

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
	auto t1 = std::chrono::high_resolution_clock::now();

	perc.resize(N + 1);
	contrib.resize(N + 1);
	updated_x.resize(N + 1);
	global_pc.resize(N + 1);
	percolation.resize(N + 1, 0);
	test_percolation.resize(N + 1, 0);

	for (int i = 1; i <= N; ++i)
		perc[i] = {x[i], i};

	// Changed here to sort the array from 1, as it also uses the zeroeth element in between sorting
	sort(perc.begin() + 1, perc.end());
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
		brandes(i, x, adj, ptr, profile1);
	for (int i = 1; i <= N; ++i)
		global_pc[i] = percolation[i] / (sum_x - contrib[i]);

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
		cerr << batch_size << ",";

		query_node.resize(1);
		int u, v;
		vector<pair<int, int>> query_edge;
		for (int i = 1; i <= batch_size; ++i)
		{
			qin >> u >> v;
			query_edge.push_back(make_pair(u, v));
		}
		auto t3 = std::chrono::high_resolution_clock::now();
		for (auto &e : query_edge)
		{
			adj[e.first].push_back(e.second);
			adj[e.second].push_back(e.first);
		}
		fill(percolation.begin(), percolation.end(), 0);
		ptr = &percolation[0];
#pragma omp parallel for reduction(+ : ptr[ : N + 1])
		for (int i = 1; i <= N; ++i)
			brandes(i, x, adj, ptr, profile2);
		auto t4 = std::chrono::high_resolution_clock::now();
		duration_actual += std::chrono::duration_cast<std::chrono::microseconds>(t4 - t3).count();
		for (int i = 1; i <= N; ++i)
			fout << percolation[i] / (sum_x - contrib[i]) << " ";
		fout << "\n";
	}
	// cerr << "Total time for updates : " << duration_actual << " mu.s." << endl;

	cerr << duration_actual << endl;

	for (int i = 1; i <= N; ++i)
		cerr << i << ","
			 << profile1[i][0] << ","
			 << profile1[i][1] << ","
			 << profile1[i][2] << ","
			 << profile1[i][3] << endl;

	for (int i = 1; i <= N; ++i)
		cerr << i << ","
			 << profile2[i][0] << ","
			 << profile2[i][1] << ","
			 << profile2[i][2] << ","
			 << profile2[i][3] << endl;

	printProfileStats(profile1);
	printHistogramForColumn(profile1, 0, 5);
	printHistogramForColumn(profile1, 1, 5);
	printHistogramForColumn(profile1, 2, 5);
	printHistogramForColumn(profile1, 3, 5);

	printProfileStats(profile2);
	printHistogramForColumn(profile2, 0, 5);
	printHistogramForColumn(profile2, 1, 5);
	printHistogramForColumn(profile2, 2, 5);
	printHistogramForColumn(profile2, 3, 5);
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