#include <bits/stdc++.h>
#include <omp.h>
#include <chrono>
using namespace std;

// compile : g++ -O3 -fopenmp -static-libstdc++ <file_name>.cpp -o computePC-dynamic-percUpdate
int numthreads = 96;

using Clock = std::chrono::high_resolution_clock;
using Duration = std::chrono::duration<double, std::micro>;  // milliseconds
namespace fs = std::filesystem;

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


template<typename T>
void write_vector(ofstream &of, const vector<T> &v) {
    size_t n = v.size();
    of.write(reinterpret_cast<const char*>(&n), sizeof(n));
    of.write(reinterpret_cast<const char*>(v.data()), n * sizeof(T));
}

template<typename T>
void read_vector(ifstream &in, vector<T> &v) {
    size_t n;
    in.read(reinterpret_cast<char*>(&n), sizeof(n));
    v.resize(n);
    in.read(reinterpret_cast<char*>(v.data()), n * sizeof(T));
}

void write_vecvec(ofstream &of, const vector<vector<int>> &vv) {
    size_t n = vv.size();
    of.write(reinterpret_cast<const char*>(&n), sizeof(n));
    for (auto &inner : vv) write_vector(of, inner);
}

void read_vecvec(ifstream &in, vector<vector<int>> &vv) {
    size_t n;
    in.read(reinterpret_cast<char*>(&n), sizeof(n));
    vv.resize(n);
    for (auto &inner : vv) read_vector(in, inner);
}

template<typename T1, typename T2>
void write_vecpair(ofstream &of, const vector<pair<T1,T2>> &vp) {
    size_t n = vp.size();
    of.write(reinterpret_cast<const char*>(&n), sizeof(n));
    for (auto &p : vp) {
        of.write(reinterpret_cast<const char*>(&p.first), sizeof(T1));
        of.write(reinterpret_cast<const char*>(&p.second), sizeof(T2));
    }
}

template<typename T1, typename T2>
void read_vecpair(ifstream &in, vector<pair<T1,T2>> &vp) {
    size_t n;
    in.read(reinterpret_cast<char*>(&n), sizeof(n));
    vp.resize(n);
    for (size_t i = 0; i < n; ++i) {
        in.read(reinterpret_cast<char*>(&vp[i].first), sizeof(T1));
        in.read(reinterpret_cast<char*>(&vp[i].second), sizeof(T2));
    }
}

void write_boolvec(ofstream &of, const vector<bool> &vb) {
    size_t n = vb.size();
    of.write(reinterpret_cast<const char*>(&n), sizeof(n));
    for (bool b : vb) {
        char c = b;
        of.write(&c, 1);
    }
}

void read_boolvec(ifstream &in, vector<bool> &vb) {
    size_t n;
    in.read(reinterpret_cast<char*>(&n), sizeof(n));
    vb.resize(n);
    for (size_t i = 0; i < n; ++i) {
        char c;
        in.read(&c, 1);
        vb[i] = (c != 0);
    }
}

// Cache I/O
bool load_cache(const string &cache_file) {
    if (!fs::exists(cache_file)) return false;
    ifstream in(cache_file, ios::binary);
    if (!in) return false;
	// read vertices
	in.read(reinterpret_cast<char*>(&vertices), sizeof(vertices));
    read_vector(in, x);
    read_vector(in, updated_x);
    read_vector(in, pc);
    read_vecvec(in, g);
    read_vecvec(in, tmp_g);
    read_vecvec(in, reach);
    read_vecvec(in, corr);
    read_vecvec(in, reachv);
    read_vecvec(in, copies);
    read_vecpair(in, st);
    read_boolvec(in, in_otherbccs);
    read_vector(in, vis);
    read_vector(in, vis1);
    read_vector(in, low);
    read_vector(in, entry);
    read_vector(in, cur_comp);
    read_vecpair<double,int>(in, perc);
    read_vector(in, rep);
    read_vector(in, query_node);
    return true;
}

void save_cache(const string &cache_file) {
    ofstream out(cache_file, ios::binary);
	// write vertices
	out.write(reinterpret_cast<const char*>(&vertices), sizeof(vertices));
    write_vector(out, x);
    write_vector(out, updated_x);
    write_vector(out, pc);
    write_vecvec(out, g);
    write_vecvec(out, tmp_g);
    write_vecvec(out, reach);
    write_vecvec(out, corr);
    write_vecvec(out, reachv);
    write_vecvec(out, copies);
    write_vecpair(out, st);
    write_boolvec(out, in_otherbccs);
    write_vector(out, vis);
    write_vector(out, vis1);
    write_vector(out, low);
    write_vector(out, entry);
    write_vector(out, cur_comp);
    write_vecpair<double,int>(out, perc);
    write_vector(out, rep);
    write_vector(out, query_node);
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

	string cache_file = input + ".cache";
    

	auto t0 = std::chrono::high_resolution_clock::now();
	vertices = n;

	pair<int, vector<double>>  res;
	double sum_x;
	vector<double> contrib;

	bool cached = load_cache(cache_file);
    if (!cached) {
		cerr<< "Computing,";
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

		res = compute_constants();
		sum_x = res.first;
		contrib = res.second;
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

		save_cache(cache_file);
	}
	else{
		cerr << "Loading,";
		res = compute_constants();
		sum_x = res.first;
		contrib = res.second;

		// for (int i = 0; i < m; i++)
		// {
		// 	int u, v;
		// 	fin >> u >> v;
		// 	if (u != v)
		// 	{
		// 		g[u].push_back(v);
		// 		g[v].push_back(u);
		// 	}
		// }
	}

	int V, E = 0;
	V = vertices;
	int cnt_reach_vec = 0;
	for (int i = 1; i <= V; ++i)
	{
		cnt_reach_vec += (int)(reach[i].size());
		E += (int)(tmp_g[i].size());
	}
	E = E / 2;
	// cout << V << "," << E << "," << cnt_reach_vec << ",";

	auto t01 = std::chrono::high_resolution_clock::now();
	// preprocess time
	cerr << std::chrono::duration_cast<std::chrono::microseconds>(t01 - t0).count() << ",";

	auto t1 = std::chrono::high_resolution_clock::now();

	vector<double> pCentrality(V + 1, 0.0), ac(V + 1, 0.0);
	double *ptr = &pCentrality[0];
// #pragma omp parallel for reduction(+ : ptr[ : V + 1])
// 	for (int i = 1; i <= V; ++i)
// 		bcc_brandes(i, x, tmp_g, reach, ptr, rep);
#pragma omp parallel
{
	// Vector to allocate local accumulator to each thread
	vector<double> local_pc(V + 1, 0.0);
	
	#pragma omp for
	for (int i = 1; i <= V; ++i)
		bcc_brandes(i,x,tmp_g,reach,&local_pc[0],rep);

	#pragma omp critical
	{
		for (int i = 1; i <= V; ++i)
		pCentrality[i] += local_pc[i];
	}
}
	for (int i = 1; i <= V; ++i)
		ac[rep[i]] += pCentrality[i];
	for (int i = 1; i <= n; ++i)
		ac[i] /= (sum_x - contrib[i]);

	auto t2 = std::chrono::high_resolution_clock::now();

	auto duration = std::chrono::duration_cast<std::chrono::microseconds>(t2 - t1).count();
	// cerr << "Initial Static Computation time : " << duration << " mu.s." << endl;
	cerr << duration << ",";


	duration = 0;
	auto duration_dynamic = duration;
	auto duration2 = duration;

	
	int query_nodes[V];

	ifstream qin(queries);double loop_ms = 0.0;
	double brandes_ms = 0.0;
	double reduction_ms = 0.0;
	int batch_size;
	while(qin >> batch_size)
	{
		updated_x = x;
		int node;
		double val;
		int query_size = 0;
		for(int i=1;i<=batch_size;++i)
		{
			qin >> node >> val;
			if(x[node] != val)
			{
				for(auto repr:copies[node])
				{
					updated_x[repr] = val;
				}
				query_nodes[query_size++] = node;
			}
		}
		batch_size = query_size;

		auto t3 = std::chrono::high_resolution_clock::now();

		batch_size = 0;
		for(auto v:corr[node])
			query_nodes[batch_size++] = v;
		
		
		ptr = &pCentrality[0];
		// #pragma omp parallel for reduction (+:ptr[:V+1])
		// for(int th=0;th<numthreads;++th)
		// {
		// 	int N = (int)x.size()-1;
		// 	queue<int> q;
		// 	stack<int> st;
		// 	vector<int> dist(N+1,-1);
		// 	vector<double> sig(N+1,0.0);
		// 	vector<double> new_delta(N+1,0.0);
		// 	vector<double> old_delta(N+1,0.0);
		// 	vector<vector<int> > pr(N+1);
		// 	for(int i=th;i<=batch_size;i+=numthreads)
		// 		update_brandes(query_nodes[i-1],node,x,updated_x,tmp_g,reach,ptr,rep,q,st,dist,sig,new_delta,old_delta,pr);
		// }
		int num_threads = omp_get_max_threads();
		int N = (int)x.size()-1;
		// Shared 2D array: each thread writes to its own row
		std::vector<std::vector<double>> local_ptr(num_threads, std::vector<double>(N+1, 0.0));

		double loop_ms = 0.0;
		double brandes_ms = 0.0;
		double reduction_ms = 0.0;

		#pragma omp parallel
		{

			auto t_loop_start = Clock::now();

			int tid = omp_get_thread_num();

			// per-thread scratch space (allocated once per thread)
			
			std::queue<int>               q;
			std::stack<int>               st;
			std::vector<int>              dist(N+1, -1);
			std::vector<double>           sig(N+1, 0.0);
			std::vector<double>           new_delta(N+1, 0.0);
			std::vector<double>           old_delta(N+1, 0.0);
			std::vector<std::vector<int>> pr(N+1);

			auto t_loop_end = Clock::now();
	
			// each thread adds its own elapsed loop time:
			Duration thread_loop = (t_loop_end - t_loop_start);

			// 1) Dynamic “finding” phase: each thread accumulates into its local_ptr row

			auto t_b_start = Clock::now();

			#pragma omp for schedule(dynamic,num_threads) nowait
			for (int i = 0; i < batch_size; ++i) {
				update_brandes(
					query_nodes[i],
					node,
					x,
					updated_x,
					tmp_g,
					reach,
					local_ptr[tid].data(),  // use double* pointer
					rep,
					q,
					st,
					dist,
					sig,
					new_delta,
					old_delta,
					pr
				);
			}
			

			// 2) Reduction phase: combine local_ptr rows into the shared ptr array
			#pragma omp barrier  // ensure finding phase is complete

			auto t_b_end = Clock::now();
			Duration thread_brandes = (t_b_end - t_b_start);

			auto t_red_start = Clock::now();

			#pragma omp for schedule(dynamic,num_threads)
			for (int v = 0; v <= N; ++v) {
				double sum = 0.0;
				for (int t = 0; t < num_threads; ++t) {
					sum += local_ptr[t][v];
				}
				ptr[v] = sum;
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
		
		cerr << loop_ms << ",";
		cerr << brandes_ms << "," ;
		cerr << reduction_ms << ",";

		auto t4 = std::chrono::high_resolution_clock::now();
		duration_dynamic += std::chrono::duration_cast<std::chrono::microseconds>( t4 - t3 ).count();
		
		fill(ac.begin(),ac.end(),0);
		for(int i=1;i<=V;++i)
			ac[rep[i]] += pCentrality[i];
		for(int i=1;i<=n;++i)
		{
			ac[i] /= (sum_x - contrib[i]);
			// fout << ac[i] << " ";
		}
		// fout << "\n";

		auto t5 = std::chrono::high_resolution_clock::now();
		duration2 = std::chrono::duration_cast<std::chrono::microseconds>(t5 - t4).count();

		x = updated_x;
	}

	cerr << duration_dynamic << "," << duration2 << "\n";

	return 0;
}