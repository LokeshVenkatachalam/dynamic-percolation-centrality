#include <bits/stdc++.h>
#include <omp.h>
#include <chrono>
using namespace std;

// compile : g++ -O3 -fopenmp -static-libstdc++ <file_name>.cpp -o computePC-dynamic-percUpdate
int numthreads = 96;

using Clock = std::chrono::high_resolution_clock;
using Duration = std::chrono::duration<double, std::micro>;  // milliseconds

void brandes(int src, vector<double> x, vector<vector<int>> &adj, double *ptr)
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
			double g;
			g = sig[p] / sig[u];
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

void bcc_brandes(int src, vector<double> x, vector<vector<int>> &adj, vector<vector<int>> &reach, double *ptr, vector<int> org)
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

		if (src != u)
		{
			for (auto s : reach[src])
			{
				for (auto r : reach[u])
				{
					if (r == org[u])
						continue;
					if (r > s)
						delta[u] += abs(x[s] - x[r]);
				}
			}
		}

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
			double g;
			g = sig[p] / sig[u];
			double add = 0.0;
			for (auto s : reach[src])
			{
				if (org[u] > s)
					add += abs(x[s] - x[u]);
			}
			g = g * (add + delta[u]);
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

void update_brandes(int node, int s, vector<double> &x, vector<double> &updated_x, vector<vector<int>> &adj, vector<vector<int>> &reach, double *ptr, vector<int> &org, queue<int> &q, stack<int> &st, vector<int> &dist, vector<double> &sig, vector<double> &new_delta, vector<double> &old_delta, vector<vector<int>> &pr)
{
	int u = node;
	q.push(u);
	dist[u] = 0;
	sig[u] = 1.0;

	while (!q.empty())
	{
		u = q.front();
		q.pop();
		st.push(u);

		if (node != u)
		{
			for (auto r : reach[u])
			{
				if (r == org[u])
					continue;
				bool is_non_query_node = (x[r] == updated_x[r]);
				if (is_non_query_node || r > s)
				{
					old_delta[u] += abs(x[s] - x[r]);
					new_delta[u] += abs(updated_x[s] - updated_x[r]);
				}
			}
		}

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
			double g_old = sig[p] / sig[u];
			double g_new = g_old;
			double add_new = 0, add_old = 0;
			bool is_non_query_node = (x[u] == updated_x[u]);
			if (is_non_query_node || org[u] > s)
			{
				add_old += abs(x[s] - x[u]);
				add_new += abs(updated_x[s] - updated_x[u]);
			}
			g_old *= old_delta[u] + add_old;
			g_new *= new_delta[u] + add_new;
			old_delta[p] += g_old;
			new_delta[p] += g_new;
		}
		if (u != node)
		{
			ptr[u] += new_delta[u];
			ptr[u] -= old_delta[u];
		}
		pr[u].clear();
		new_delta[u] = 0;
		old_delta[u] = 0;
		sig[u] = 0;
		dist[u] = -1;
	}
}

int n, m;
int vertices;
int timer;
vector<double> x, updated_x, pc;
vector<vector<int>> reach;
vector<vector<int>> corr;
vector<vector<int>> reachv;
vector<vector<int>> copies;
vector<pair<int, int>> st;
vector<int> vis, vis1, low, entry, cur_comp;
vector<vector<int>> g, tmp_g;
vector<bool> in_otherbccs;
vector<pair<double, int>> perc;
vector<int> rep;
vector<int> query_node;

void dfs(int u, int par)
{
	timer++;
	entry[u] = timer;
	vis[u] = 2;
	low[u] = entry[u];
	vector<int> children = {u};

	for (int v : g[u])
	{
		if (vis[v] < 2)
		{
			st.push_back({u, v});
			dfs(v, u);
			low[u] = min(low[u], low[v]);

			if (low[v] >= entry[u])
			{
				++vertices;
				rep.push_back(u);
				copies[u].push_back(vertices);
				x[vertices] = x[u];
				vector<int> unique_vertices;
				while (st.back() != make_pair(u, v))
				{
					int p = st.back().first;
					int q = st.back().second;
					st.pop_back();
					if (p == u)
						p = vertices;
					if (q == u)
						q = vertices;
					unique_vertices.push_back(p);
					unique_vertices.push_back(q);
					tmp_g[p].push_back(q);
					tmp_g[q].push_back(p);
				}
				st.pop_back();
				tmp_g[vertices].push_back(v);
				tmp_g[v].push_back(vertices);
				unique_vertices.push_back(v);
				unique_vertices.push_back(vertices);
				sort(unique_vertices.begin(), unique_vertices.end());
				unique_vertices.erase(unique(unique_vertices.begin(), unique_vertices.end()), unique_vertices.end());

				for (int uv : unique_vertices)
				{
					if (uv != vertices)
					{
						for (auto v : reachv[uv])
						{
							children.push_back(v);
							in_otherbccs[v] = 1;
						}
					}
				}

				for (int i : cur_comp)
				{
					if (!in_otherbccs[i])
					{
						corr[i].push_back(vertices);
						reach[vertices].push_back(i);
					}
					else
						in_otherbccs[i] = 0;
				};
				sort(reach[vertices].begin(), reach[vertices].end());
			}
		}
		else if (v != par && entry[v] < entry[u])
		{
			st.push_back({u, v});
			low[u] = min(low[u], entry[v]);
		}
	}
	reachv[u] = children;
	reach[u].clear();
	sort(reachv[u].begin(), reachv[u].end());
	reachv[u].erase(unique(reachv[u].begin(), reachv[u].end()), reachv[u].end());
	for (int i : reachv[u])
	{
		corr[i].push_back(u);
		reach[u].push_back(i);
	}

	vis[u] = 3;
}

void prelim_dfs(int u)
{
	vis[u] = 1;
	cur_comp.push_back(u);
	for (int v : g[u])
	{
		if (!vis[v])
		{
			prelim_dfs(v);
		}
	}
}

pair<int, vector<double>> compute_constants()
{
	int N = (int)x.size() - 1;
	vector<pair<double, int>> perc(N + 1);
	vector<double> contrib(N + 1, 0.0);
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
	return make_pair(sum_x, contrib);
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

	// Extract dataset name from input path
	size_t last_slash_pos = input.find_last_of('/');
	size_t last_dot_pos = input.find_last_of('.');
	string dataset_name = "unknown_dataset";
	if (last_slash_pos != string::npos && last_dot_pos != string::npos && last_dot_pos > last_slash_pos)
	{
		dataset_name = input.substr(last_slash_pos + 1, last_dot_pos - last_slash_pos - 1);
	}
	else if (last_dot_pos != string::npos)
	{ // Handle cases where there's no slash
		dataset_name = input.substr(0, last_dot_pos);
	}
	else
	{ // Handle cases where there's no dot or slash
		dataset_name = input;
	}

	// Extract query size from queries path
	string query_size_str = "unknown_query_size";
	size_t queries_pos = queries.find("queries_");
	if (queries_pos != string::npos)
	{
		size_t next_slash_pos = queries.find('/', queries_pos);
		if (next_slash_pos != string::npos)
		{
			query_size_str = queries.substr(queries_pos + 8, next_slash_pos - (queries_pos + 8));
		}
		else
		{ // Handle if queries_ is at the end or followed by something else without '/'
			query_size_str = queries.substr(queries_pos + 8);
		}
	}

	omp_set_num_threads(numthreads);
	cerr << dataset_name << ",";   // Print extracted dataset name
	cerr << query_size_str << ","; // Print extracted query size
	cerr << numthreads << ",";
	cerr << "DPC-CPU,";

	ifstream fin(input);
	ofstream fout(output);

	fin >> n >> m;
	cerr << n << "," << m << ",";


	auto t0 = std::chrono::high_resolution_clock::now();

	vertices = n;
	for (int i = 0; i <= n; ++i)
		rep.push_back(i);
	g.resize(n + 1);
	copies.resize(n + 1);
	for (int i = 1; i <= n; ++i)
		copies[i].push_back(i);
	tmp_g.resize(2 * m + 1);
	x.resize(n + 1);
	reach.resize(2 * m + 1);
	reachv.resize(n + 1);
	corr.resize(n + 1);
	vis.resize(n + 1);
	low.resize(n + 1);
	entry.resize(n + 1);
	in_otherbccs.resize(n + 1, 0);
	perc.resize(n + 1);
	pc.resize(n + 1, 0);

	timer = 0;
	x[0] = 0;
	for (int i = 1; i <= n; i++)
	{
		x[i] = (1.0 / (double)(n)) * (rand() % n);
	}
	for (int i = 0; i < m; i++)
	{
		int u, v;
		fin >> u >> v;
		if (u != v)
		{
			g[u].push_back(v);
			g[v].push_back(u);
		}
	}

	auto res = compute_constants();
	double sum_x = res.first;
	vector<double> contrib = res.second;
	x.resize(2 * m + 1);

	for (int i = 1; i <= n; i++)
	{
		if (!vis[i])
		{
			cur_comp.clear();
			prelim_dfs(i);
			for (auto v : cur_comp)
			{
				if ((int)g[v].size() != 1)
				{
					dfs(v, 0);
					break;
				}
			}
		}
	}

	tmp_g.resize(vertices + 1);
	reach.resize(vertices + 1);
	reachv.resize(vertices + 1);
	x.resize(vertices + 1);

	int V, E = 0;
	V = vertices;
	int cnt_reach_vec = 0;
	for (int i = 1; i <= V; ++i)
	{
		cnt_reach_vec += (int)(reach[i].size());
		E += (int)(tmp_g[i].size());
	}
	E = E / 2;

	auto t01 = std::chrono::high_resolution_clock::now();
	// preprocess time
	cerr << std::chrono::duration_cast<std::chrono::microseconds>(t01 - t0).count() << ",";
	// double *ptr = &pc[0];
	// #pragma omp parallel for reduction (+:ptr[:n+1])
	// for(int i=1;i<=n;++i)
	// 	brandes(i,x,g,ptr);
	// for(int i=1;i<=n;++i)
	// 	pc[i] /= (sum_x - contrib[i]);

	auto t1 = std::chrono::high_resolution_clock::now();

	vector<double> pCentrality(V + 1, 0.0), ac(V + 1, 0.0);
	double *ptr = &pCentrality[0];
#pragma omp parallel for reduction(+ : ptr[ : V + 1])
	for (int i = 1; i <= V; ++i)
		bcc_brandes(i, x, tmp_g, reach, ptr, rep);
	for (int i = 1; i <= V; ++i)
		ac[rep[i]] += pCentrality[i];
	for (int i = 1; i <= n; ++i)
		ac[i] /= (sum_x - contrib[i]);

	auto t2 = std::chrono::high_resolution_clock::now();

	// double max_diff = 0;
	// for(int i=1;i<=n;++i)
	// 	max_diff = max(max_diff,abs(ac[i]-pc[i]));

	auto duration = std::chrono::duration_cast<std::chrono::microseconds>(t2 - t1).count();
	// cerr << "Initial Static Computation time : " << duration << " mu.s." << endl;
	cerr << duration << ",";
	// cerr << "Max difference in PC point-wise : " << max_diff << "\n";

	duration = 0;
	auto duration_dynamic = duration;
	auto duration2 = duration;

	int query_nodes[V];

	ifstream qin(queries);
	int batch_size;
	while (qin >> batch_size)
	{
		updated_x = x;
		int node;
		double val;
		int query_size = 0;
		for (int i = 1; i <= batch_size; ++i)
		{
			qin >> node >> val;
			if (x[node] != val)
			{
				for (auto repr : copies[node])
				{
					updated_x[repr] = val;
				}
				query_nodes[query_size++] = node;
			}
		}
		batch_size = query_size;

		auto t3 = std::chrono::high_resolution_clock::now();

		batch_size = 0;
		for (auto v : corr[node])
			query_nodes[batch_size++] = v;

		ptr = &pCentrality[0];
// #pragma omp parallel for reduction(+ : ptr[ : V + 1])
// 		for (int th = 0; th < numthreads; ++th)
// 		{
// 			int N = (int)x.size() - 1;
// 			queue<int> q;
// 			stack<int> st;
// 			vector<int> dist(N + 1, -1);
// 			vector<double> sig(N + 1, 0.0);
// 			vector<double> new_delta(N + 1, 0.0);
// 			vector<double> old_delta(N + 1, 0.0);
// 			vector<vector<int>> pr(N + 1);
// 			for (int i = th; i < batch_size; i += numthreads)
// 				update_brandes(query_nodes[i - 1], node, x, updated_x, tmp_g, reach, ptr, rep, q, st, dist, sig, new_delta, old_delta, pr);
// 		}
		// #pragma omp parallel
		// {
		// 	// Thread‐local accumulator array
		// 	vector<double> local_ptr(V + 1, 0.0);

		// 	// Thread‐local workspace (allocated once per thread)
		// 	int N = (int)x.size() - 1;
		// 	queue<int> q;
		// 	stack<int> st;
		// 	vector<int> dist(N + 1);
		// 	vector<double> sig(N + 1);
		// 	vector<double> new_delta(N + 1);
		// 	vector<double> old_delta(N + 1);
		// 	vector<vector<int>> pr(N + 1);
			
		// 	#pragma omp for schedule(dynamic, 16)
		// 	for (int i = 0; i < batch_size; ++i)
		// 	{
		// 		// reset per‐iteration state
		// 		fill(dist.begin(),    dist.end(),    -1);
		// 		fill(sig.begin(),     sig.end(),     0.0);
		// 		fill(new_delta.begin(), new_delta.end(), 0.0);
		// 		fill(old_delta.begin(), old_delta.end(), 0.0);
		// 		for (auto &plist : pr) plist.clear();
		// 		while (!q.empty()) q.pop();
        // 		while (!st.empty()) st.pop();

		// 		// run the Brandes update, writing into local_ptr
		// 		update_brandes(
		// 			query_nodes[i], node, x, updated_x,
		// 			tmp_g, reach,
		// 			&local_ptr[0],    // use thread‐local accumulator
		// 			rep,
		// 			q, st,
		// 			dist, sig,
		// 			new_delta, old_delta,
		// 			pr
		// 		);
		// 	}

		// 	// fold thread locals back into the global ptr[]
		// 	#pragma omp critical
		// 	{
		// 		for (int v = 1; v <= V; ++v)
		// 			ptr[v] += local_ptr[v];
		// 	}
		// }

		double loop_ms = 0.0;
		double brandes_ms = 0.0;
		double reduction_ms = 0.0;
	
		#pragma omp parallel
		{
			vector<double> local_ptr(V+1, 0.0);
			// per-thread accumulators for brandes time
			Duration thread_brandes(0);

			int N = (int)x.size() - 1;
			queue<int> q;
			stack<int> st;
			vector<int> dist(N + 1);
			vector<double> sig(N + 1);
			vector<double> new_delta(N + 1);
			vector<double> old_delta(N + 1);
			vector<vector<int>> pr(N + 1);
			
	
			// 1) time the for-loop itself
			auto t_loop_start = Clock::now();
			#pragma omp for schedule(static)
			for (int i = 0; i < batch_size; ++i) {
				// 2) time just the update_brandes call

				// reset per‐iteration state
				auto t_enter = Clock::now();
				fill(dist.begin(),    dist.end(),    -1);
				fill(sig.begin(),     sig.end(),     0.0);
				fill(new_delta.begin(), new_delta.end(), 0.0);
				fill(old_delta.begin(), old_delta.end(), 0.0);
				for (auto &plist : pr) plist.clear();
				while (!q.empty()) q.pop();
        		while (!st.empty()) st.pop();

				auto t_b_start = Clock::now();
				update_brandes(
								query_nodes[i], node, x, updated_x,
								tmp_g, reach,
								&local_ptr[0],    // use thread‐local accumulator
								rep,
								q, st,
								dist, sig,
								new_delta, old_delta,
								pr
							);
				auto t_b_end = Clock::now();
				thread_brandes += (t_b_end - t_b_start);
			}
			auto t_loop_end = Clock::now();
	
			// each thread adds its own elapsed loop time:
			Duration thread_loop = (t_loop_end - t_loop_start);
	
			// 3) time the reduction
			auto t_red_start = Clock::now();
			#pragma omp critical
			{
				for (int v = 1; v <= V; ++v)
					ptr[v] += local_ptr[v];
			}
			auto t_red_end = Clock::now();
			Duration thread_red = (t_red_end - t_red_start);
	
			// reduce your timings across threads into the master totals
			#pragma omp atomic
			loop_ms      += thread_loop.count();
			#pragma omp atomic
			brandes_ms   += thread_brandes.count();
			#pragma omp atomic
			reduction_ms += thread_red.count();
		}
	
		// Because each of the above was summed over T threads,
		// you might want to divide by omp_get_max_threads() to get per-thread averages,
		// or just report the totals if you’re comparing relative cost.
		cerr << loop_ms      << ",";
		cerr << brandes_ms   << ",";
		cerr << reduction_ms << ",";


		auto t4 = std::chrono::high_resolution_clock::now();
		duration_dynamic += std::chrono::duration_cast<std::chrono::microseconds>(t4 - t3).count();

		fill(ac.begin(), ac.end(), 0);
		for (int i = 1; i <= V; ++i)
			ac[rep[i]] += pCentrality[i];
		for (int i = 1; i <= n; ++i)
		{
			ac[i] /= (sum_x - contrib[i]);
			// fout << ac[i] << " ";
		}
		// fout << "\n";
		auto t5 = std::chrono::high_resolution_clock::now();
		duration2 = std::chrono::duration_cast<std::chrono::microseconds>(t5 - t4).count();

		x = updated_x;
	}
	// cerr << "Total time for updates : " << duration_dynamic << " mu.s." <<endl;
	// cerr << duration_dynamic << endl;
	cerr << duration_dynamic << "," << duration2 << "\n";
	// 	fill(pc.begin(), pc.end(), 0);
	// 	ptr = &pc[0];
	// #pragma omp parallel for reduction(+ : ptr[ : n + 1])
	// 	for (int i = 1; i <= n; ++i)
	// 		brandes(i, x, g, ptr);
	// 	for (int i = 1; i <= n; ++i)
	// 		pc[i] /= (sum_x - contrib[i]);

	// 	fill(ac.begin(), ac.end(), 0);
	// 	for (int i = 1; i <= V; ++i)
	// 		ac[rep[i]] += pCentrality[i];
	// 	for (int i = 1; i <= n; ++i)
	// 		ac[i] /= (sum_x - contrib[i]);

	// 	max_diff = 0;
	// 	for (int i = 1; i <= n; ++i)
	// 		max_diff = max(max_diff, abs(ac[i] - pc[i]));
	// 	// cerr << "Max difference in PC point-wise : " << max_diff << "\n";
	// 	cerr << "," << max_diff << "\n";
	return 0;
}
