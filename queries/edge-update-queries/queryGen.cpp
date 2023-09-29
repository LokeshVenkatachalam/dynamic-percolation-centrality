#include<bits/stdc++.h>
#include<omp.h>
#include<chrono>
using namespace std;

int N,M;
int timer;
vector<pair<int,int> > st;
vector<int> vis,low,entry;

vector<vector<int> > adj;
vector<pair<int,int> > possible_edges;
map<int,bool> mp[1000000];

mt19937 rng(chrono::steady_clock::now().time_since_epoch().count());
int bcccnt = 0;

void dfs(int u, int par){
	timer++;
	entry[u] = timer;
	vis[u] = 2;
	low[u] = entry[u];
	for(int v:adj[u]){
		if(vis[v]< 2){
			st.push_back({u,v});
			dfs(v, u);
			low[u] = min(low[u], low[v]);
			if(low[v] >= entry[u]){
				vector<int> unique_vertices;
				while(st.back() != make_pair(u,v)){
					int p = st.back().first;
					int q = st.back().second;
					st.pop_back();;
					unique_vertices.push_back(p);
					unique_vertices.push_back(q);
					mp[p][q] = mp[q][p] = 1;
				}
				unique_vertices.push_back(v);
				unique_vertices.push_back(u);
				mp[u][v] = mp[v][u] = 1;
				st.pop_back();
				sort(unique_vertices.begin(), unique_vertices.end());
				unique_vertices.erase(unique(unique_vertices.begin(), unique_vertices.end()),unique_vertices.end());
				bcccnt += 1;
				for(int i=0;i<(int)unique_vertices.size();++i)
				{
					for(int j=i+1;j<(int)unique_vertices.size();++j)
					{
						int u = unique_vertices[i];
						int v = unique_vertices[j];
						if(!mp[u][v])
							cout << u << " " << v << endl;
						if(!mp[u][v] && (rand()%1000) == 1)
						{
							possible_edges.push_back(make_pair(u,v));
							mp[u][v] = mp[v][u] = 1;
						}
					}
				}
			}
		}
		else if(v != par && entry[v] < entry[u]){ //back edge
			st.push_back({u,v});
			low[u] = min(low[u], entry[v]);
		}
	}
	vis[u] = 3;
}
/*
void dfs(int u, int par){
	timer++;
	entry[u] = timer;
	vis[u] = 2;
	low[u] = entry[u];

	for(int v:adj[u])
	{
		if(vis[v]< 2)
		{
			st.push_back({u,v});
			dfs(v, u);
			low[u] = min(low[u], low[v]);

			if(low[v] >= entry[u])
			{
				vector<int> unique_vertices;
				while(st.back() != make_pair(u,v)){
					int p = st.back().first;
					int q = st.back().second;
					st.pop_back();
					unique_vertices.push_back(p);
					unique_vertices.push_back(q);
					mp[p][q] = mp[q][p] = 1;
				}
				st.pop_back();
				unique_vertices.push_back(v);
				unique_vertices.push_back(u);
				mp[u][v] = mp[v][u] = 1;
				sort(unique_vertices.begin(), unique_vertices.end());
				unique_vertices.erase(unique(unique_vertices.begin(), unique_vertices.end()),unique_vertices.end());

				++bcccnt;
				for(int i=0;i<(int)unique_vertices.size();++i)
				{
					for(int j=i+1;j<(int)unique_vertices.size();++j)
					{
						int u = unique_vertices[i];
						int v = unique_vertices[j];
						if(!mp[u][v])
							cout << u << " " << v << "\n";
						if(!mp[u][v] && (rand()%1000) == 1)
						{
							possible_edges.push_back(make_pair(u,v));
							mp[u][v] = mp[v][u] = 1;
						}
					}
				}
			}
		}
		else if(v != par && entry[v] < entry[u])
		{
			st.push_back({u,v});
			low[u] = min(low[u], entry[v]);
		}
	}
	vis[u] = 3;
}
*/
int main( int argc, char **argv ) {
    string input = argv[1];
    int query_size = atoi(argv[2]);
    int batch_size = atoi(argv[3]);

    ifstream fin(input);
	fin >> N >> M; 
	int u,v;
	adj.resize(N+1);
	set<pair<int,int> > exist_edges;
	for(int i=0;i<M;++i)
	{
		fin >> u >> v;
		adj[u].push_back(v);
		adj[v].push_back(u);
	}
	vis.resize(N+1);
	low.resize(N+1);
	entry.resize(N+1);
	for(int i=1;i<=N;i++){
		if(!vis[i]){
			dfs(i,0);
		}
	}
	random_shuffle(possible_edges.begin(),possible_edges.end());
	for(int t=0;t<query_size;++t)
	{
		// cout<<batch_size<<endl;
		// for(int i=t*batch_size;i<(t+1)*batch_size;++i)
		// 	cout << possible_edges[i].first << " " << possible_edges[i].second << endl;
	}
}