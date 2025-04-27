#include <bits/stdc++.h>
// #include <omp.h> // Not needed for this version
#include <chrono>
#include <vector>   // Added for vector
#include <numeric>  // Added for std::iota
#include <random>   // Added for std::mt19937 and std::uniform_real_distribution

using namespace std;

int main(int argc, char **argv)
{
    ios::sync_with_stdio(false);
    cin.tie(0);
    cout.tie(0);

    if (argc != 3) {
        cerr << "Usage: " << argv[0] << " <input_graph_file> <total_queries>" << endl;
        return 1;
    }

    int N, total_queries;
    string input_graph_path = argv[1];
    total_queries = atoi(argv[2]);

    ifstream fin(input_graph_path);
    if (!fin.is_open()) {
        cerr << "Error opening graph file: " << input_graph_path << endl;
        return 1;
    }
    // Read only the number of nodes (N) from the graph file
    // Assuming the first line of the graph file contains N (and maybe M)
    // Adjust if the format is different
    string first_line;
    getline(fin, first_line);
    stringstream ss(first_line);
    ss >> N; // Read the first number as N
    fin.close();

    if (N <= 0) {
         cerr << "Error reading number of nodes (N) from graph file or N is invalid." << endl;
         return 1;
    }


    vector<int> nodes(N);
    iota(nodes.begin(), nodes.end(), 1); // Fill vector with 1, 2, ..., N

    // Use a better random number generator
    unsigned seed = chrono::system_clock::now().time_since_epoch().count();
    mt19937 generator(seed);
    uniform_real_distribution<double> distribution(0.0, 1.0);

    cout << total_queries << "\n"; // Print the total number of queries first

    for (int i = 0; i < total_queries; ++i)
    {
        // Shuffle the nodes vector to pick a random node without repetition *if needed*
        // For large N and relatively small total_queries, picking with replacement is simpler and often acceptable.
        // If unique nodes are strictly required for each query, uncomment the shuffle line.
        // shuffle(nodes.begin(), nodes.end(), generator);

        // Pick a random node ID (from 1 to N)
        uniform_int_distribution<int> node_dist(1, N);
        int random_node_id = node_dist(generator); // nodes[i % N]; // Use shuffled index or just random

        // Generate a random percolation threshold (0.000 to 0.999)
        double random_threshold = floor(distribution(generator) * 1000) / 1000.0;

        cout << random_node_id << " " << fixed << setprecision(3) << random_threshold << "\n";
    }

    return 0; // Added return 0 for successful execution
}