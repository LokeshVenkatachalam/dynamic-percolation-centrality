g++ -O3 src/query-generator/edge-update-queryGen.cpp -o src/query-generator/edge-update-gen  

./src/query-generator/edge-update-gen ./datasets/brightkite.in 1 > ./queries/edge-update-queries/queries_1/brightkite_queries
./src/query-generator/edge-update-gen ./datasets/brightkite.in 10 > ./queries/edge-update-queries/queries_10/brightkite_queries
./src/query-generator/edge-update-gen ./datasets/brightkite.in 40 > ./queries/edge-update-queries/queries_40/brightkite_queries
./src/query-generator/edge-update-gen ./datasets/brightkite.in 100 > ./queries/edge-update-queries/queries_100/brightkite_queries
./src/query-generator/edge-update-gen ./datasets/slashdot.in 1 > ./queries/edge-update-queries/queries_1/slashdot_queries
./src/query-generator/edge-update-gen ./datasets/slashdot.in 10 > ./queries/edge-update-queries/queries_10/slashdot_queries
./src/query-generator/edge-update-gen ./datasets/slashdot.in 40 > ./queries/edge-update-queries/queries_40/slashdot_queries
./src/query-generator/edge-update-gen ./datasets/slashdot.in 100 > ./queries/edge-update-queries/queries_100/slashdot_queries
./src/query-generator/edge-update-gen ./datasets/p2p-Gnutella25.in 1 > ./queries/edge-update-queries/queries_1/p2p-Gnutella25_queries
./src/query-generator/edge-update-gen ./datasets/p2p-Gnutella25.in 10 > ./queries/edge-update-queries/queries_10/p2p-Gnutella25_queries
./src/query-generator/edge-update-gen ./datasets/p2p-Gnutella25.in 40 > ./queries/edge-update-queries/queries_40/p2p-Gnutella25_queries
./src/query-generator/edge-update-gen ./datasets/p2p-Gnutella25.in 100 > ./queries/edge-update-queries/queries_100/p2p-Gnutella25_queries