#include <bits/stdc++.h>
#include <omp.h>
#include <chrono>
using namespace std;


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