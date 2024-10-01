#include <iostream>
#include <vector>
#include <stack>
#include <set>
#include <map>
#include <algorithm>
#include <cstdlib>
#include <ctime>
#include <fstream>

#define LL long long

using namespace std;

vector<vector<LL>> graph;         // Adjacency list of the graph
vector<LL> disc, low, parent;
vector<bool> visited;
LL timeCounter = 0;
stack<pair<LL, LL>> edgeStack;  // To store edges for each BCC
vector<vector<pair<LL, LL>>> biconnectedComponents;
set<pair<LL, LL>> initialEdges; // Store initial edges for quick lookup

void addEdge(LL u, LL v) {
    graph[u].push_back(v);
    graph[v].push_back(u);
    initialEdges.insert({min(u, v), max(u, v)});  // Store the edge in sorted form
}

// Tarjan's algorithm to find Biconnected Components
void tarjanBCC(LL u) {
    visited[u] = true;
    disc[u] = low[u] = ++timeCounter;
    LL children = 0;

    for (LL v : graph[u]) {
        if (!visited[v]) {
            children++;
            parent[v] = u;
            edgeStack.push({u, v});  // Store the edge in the stack

            tarjanBCC(v);

            // Check if the subtree rooted at v has a connection back to one of the ancestors of u
            low[u] = min(low[u], low[v]);

            // If u is an articulation poLL, pop all edges of this BCC
            if ((parent[u] == -1 && children > 1) || (parent[u] != -1 && low[v] >= disc[u])) {
                vector<pair<LL, LL>> bcc;
                while (edgeStack.top() != make_pair(u, v)) {
                    bcc.push_back(edgeStack.top());
                    edgeStack.pop();
                }
                bcc.push_back(edgeStack.top());
                edgeStack.pop();
                biconnectedComponents.push_back(bcc);
            }
        } else if (v != parent[u] && disc[v] < disc[u]) {
            low[u] = min(low[u], disc[v]);
            edgeStack.push({u, v});  // Back edge
        }
    }
}

// Function to find all Biconnected Components
void findBCC(LL n) {
    for (LL i = 0; i < n; i++) {
        if (!visited[i]) {
            tarjanBCC(i);

            // If stack still contains edges, pop them as a BCC
            if (!edgeStack.empty()) {
                vector<pair<LL, LL>> bcc;
                while (!edgeStack.empty()) {
                    bcc.push_back(edgeStack.top());
                    edgeStack.pop();
                }
                biconnectedComponents.push_back(bcc);
            }
        }
    }
}

// Function to distribute query edges proportionally and randomly within each BCC
set<pair<LL,LL>> distributeEdges(LL querySize, LL n) {
    LL totalNodes = 0;
	LL AvailableEdges = 0;
    vector<LL> bccNodeCounts;
	vector<LL> bccEdgesCount;
	vector<LL> bccAvailableEdges;

    // Calculate number of nodes in each BCC and total number of nodes
    for (const auto& bcc : biconnectedComponents) {
        set<LL> nodes;
		bccEdgesCount.push_back(bcc.size());
        for (const auto& edge : bcc) {
            nodes.insert(edge.first);
            nodes.insert(edge.second);
        }
        totalNodes += nodes.size();
        bccNodeCounts.push_back(nodes.size());
		AvailableEdges += ((nodes.size() * (nodes.size() - 1)) / 2 - bcc.size());
		bccAvailableEdges.push_back((nodes.size() * (nodes.size() - 1)) / 2 - bcc.size());
    }

	cerr<<"Total Nodes: "<<totalNodes<<endl;
	cerr<<"Available Edges: "<<AvailableEdges<<endl;
	cerr<<"Number of BCCs: "<<biconnectedComponents.size()<<endl;

	// cout<<"Total Nodes: "<<totalNodes<<" || Total Edges: "<<AvailableEdges;

	set<pair<LL,LL>> FinalEdges;
	set<pair<LL,LL>> extraEdges;
	
	LL FountEdges = 0;

    // Distribute edges to each BCC proportionally
    for (LL i = 0; i < biconnectedComponents.size(); i++) {
        // LL bccEdgesToAdd = ((querySize * bccNodeCounts[i]) / totalNodes) + 1 ;
		LL bccEdgesToAdd = ((querySize * bccAvailableEdges[i]) / AvailableEdges) + 1 ;
		
		// cout<<"BCC ID: "<<i+1<<" ||  Edges to Added: " << bccEdgesToAdd<<" || Edges Available : "<< bccAvailableEdges[i]<<endl;

        set<pair<LL, LL>> addedEdges;
        set<pair<LL, LL>> possibleEdges_set;
		vector<pair<LL, LL>> possibleEdges; // To store available new edges

        set<LL> nodes;
        for (const auto& edge : biconnectedComponents[i]) {
            nodes.insert(edge.first);
            nodes.insert(edge.second);
        }

        // Generate all possible new edges between nodes in the same BCC
        for (LL u : nodes) {
			for (LL v : nodes) {
				if( u >=v )
					continue;
                if (u != v && initialEdges.find({min(u, v), max(u, v)}) == initialEdges.end() &&
                    addedEdges.find({min(u, v), max(u, v)}) == addedEdges.end()) {
                    // New edge between u and v
					if(possibleEdges_set.find({min(u, v), max(u, v)}) == possibleEdges_set.end()){
                    	possibleEdges_set.insert({min(u, v), max(u, v)});
						possibleEdges.push_back({min(u, v), max(u, v)});
					}

                }
            }
        }

        // Randomly shuffle the possible edges
        random_shuffle(possibleEdges.begin(), possibleEdges.end());

        // Add edges to this BCC
        for (const auto& edge : possibleEdges) {
            if (bccEdgesToAdd == 0)
                break;
			if (bccEdgesToAdd == 1)
				extraEdges.insert(edge);
			else if (bccEdgesToAdd > 1){
				FinalEdges.insert(edge);
				FountEdges++;
			}

            addedEdges.insert(edge);
			bccEdgesToAdd--;
            // cout << edge.first + 1 << " " << edge.second + 1<< endl; // Output the new edge
		}
            

	}


	cerr<<"Number of Edges Added in R1: "<<FountEdges<<endl;

	if(FountEdges > querySize){
		cerr<<"Error: More edges added than required"<<endl;
	}

	vector<pair<LL, LL>> extraEdgesVec;

	if(FountEdges != querySize){
		// convert extra edges to vector
		for (const auto& edge : extraEdges) {
			extraEdgesVec.push_back(edge);
		}
		random_shuffle(extraEdgesVec.begin(), extraEdgesVec.end());
	}

	for (const auto& edge : extraEdgesVec) {
		if (FountEdges == querySize)
			break;

		FinalEdges.insert(edge);
		FountEdges++;
		// cout << edge.first + 1 << " " << edge.second + 1 << endl; // Output the new edge
	}

	cerr<< "Number of Edges Added in R1+R2: "<<FountEdges<<endl;
	if(FountEdges < querySize){
		cerr<<"Error: Less edges added than required"<<endl;
	}

	return FinalEdges;
}

int main(int argc, char* argv[]) {
    if (argc != 3) {
        cerr << "Usage: " << argv[0] << " <input_file> <query_size>" << endl;
        return 1;
    }

    // Read input file name and query size from command line

    string inputFile = argv[1];

	cerr<< "Dataset Name: "<<inputFile<<endl;

    LL querySize = atoi(argv[2]);

    ifstream infile(inputFile);
    if (!infile) {
        cerr << "Error: Unable to open input file." << endl;
        return 1;
    }

    srand(time(0));  // Seed the random number generator

    LL n, m;
    infile >> n >> m;  // Number of nodes and edges

    // Resize graph and other vectors dynamically based on the number of nodes
    graph.resize(n);
    disc.resize(n, -1);
    low.resize(n, -1);
    parent.resize(n, -1);
    visited.resize(n, false);

    for (LL i = 0; i < m; i++) {
        LL u, v;
        infile >> u >> v;
		u--;
		v--;
        if (u >= n || v >= n) {
            cerr << "Error: Edge contains invalid node number." << endl;
            return 1;
        }
        addEdge(u, v);
    }

    infile.close();

	cerr << "Input file read successfully." << endl;
	cerr << "Number of nodes: " << n << endl;
	cerr << "Number of edges: " << m << endl;
	cerr << "Query Size: " << querySize << endl;
    
    // Initialize data structures
    timeCounter = 0;

    // Step 1: Find biconnected components
    findBCC(n);

    // Step 2: Distribute query edges to biconnected components randomly
    auto ANS = distributeEdges(querySize, n);

	// Output the new edges
	cout << ANS.size() << endl;

	for (const auto& edge : ANS) {
		cout << edge.first + 1 << " " << edge.second + 1 << endl; // Output the new edge
	}

    return 0;
}
