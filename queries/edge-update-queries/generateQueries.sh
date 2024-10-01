# .././BCCspecific_queryGen.o ../../../datasets/PGPgiantcompo.in $1  > PGPgiantcompo_queries
# .././BCCspecific_queryGen.o ../../../datasets/wikiVote.in $1  > wikiVote_queries
# .././BCCspecific_queryGen.o ../../../datasets/slashdot.in $1  > slashdot_queries
# .././BCCspecific_queryGen.o ../../../datasets/web-indochina-2004.in $1  > web-indochina-2004_queries
# .././BCCspecific_queryGen.o ../../../datasets/web-standford.in $1  > web-standford_queries
# .././BCCspecific_queryGen.o ../../../datasets/web-webbase-2001.in $1  > web-webbase-2001_queries
# .././BCCspecific_queryGen.o ../../../datasets/p2p-Gnutella24.in $1  > p2p-Gnutella24_queries
# .././BCCspecific_queryGen.o ../../../datasets/p2p-Gnutella25.in $1  > p2p-Gnutella25_queries
# .././BCCspecific_queryGen.o ../../../datasets/p2p-Gnutella30.in $1  > p2p-Gnutella30_queries
# .././BCCspecific_queryGen.o ../../../datasets/hi2010.in $1  > hi2010_queries
# .././BCCspecific_queryGen.o ../../../datasets/email-enron.in $1  > email-enron_queries
# .././BCCspecific_queryGen.o ../../../datasets/facebook_clean.in $1  > facebook_clean_queries

#!/bin/bash

.././BCCspecific_queryGen.o ../../../datasets/PGPgiantcompo.in $1  > PGPgiantcompo_queries 2> ./out_txt/PGPgiantcompo.md &
.././BCCspecific_queryGen.o ../../../datasets/wikiVote.in $1  > wikiVote_queries 2> ./out_txt/wikiVote.md &
.././BCCspecific_queryGen.o ../../../datasets/slashdot.in $1  > slashdot_queries 2> ./out_txt/slashdot.md &
.././BCCspecific_queryGen.o ../../../datasets/web-indochina-2004.in $1  > web-indochina-2004_queries 2> ./out_txt/web-indochina-2004.md &
.././BCCspecific_queryGen.o ../../../datasets/web-standford.in $1  > web-standford_queries 2> ./out_txt/web-standford.md &
.././BCCspecific_queryGen.o ../../../datasets/web-webbase-2001.in $1  > web-webbase-2001_queries 2> ./out_txt/web-webbase-2001.md &
.././BCCspecific_queryGen.o ../../../datasets/p2p-Gnutella24.in $1  > p2p-Gnutella24_queries 2> ./out_txt/p2p-Gnutella24.md &
.././BCCspecific_queryGen.o ../../../datasets/p2p-Gnutella25.in $1  > p2p-Gnutella25_queries 2> ./out_txt/p2p-Gnutella25.md &
.././BCCspecific_queryGen.o ../../../datasets/p2p-Gnutella30.in $1  > p2p-Gnutella30_queries 2> ./out_txt/p2p-Gnutella30.md &
.././BCCspecific_queryGen.o ../../../datasets/hi2010.in $1  > hi2010_queries 2> ./out_txt/hi2010.md &
.././BCCspecific_queryGen.o ../../../datasets/email-enron.in $1  > email-enron_queries 2> ./out_txt/email-enron.md &
.././BCCspecific_queryGen.o ../../../datasets/facebook_clean.in $1  > facebook_clean_queries 2> ./out_txt/facebook_clean.md &

# Wait for all background processes to finish
wait

echo "All queries have been generated."
