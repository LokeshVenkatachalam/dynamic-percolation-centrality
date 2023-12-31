#!/bin/bash
#SBATCH --nodelist=node03
#SBATCH --nodes=1                   ### Node count required for the job
#SBATCH --cpus-per-task=64          ### Number of threads per task (OMP threads)

# python run.py --algorithm dynperc --dataset PGPgiantcompo -b 40 -o my_outfile.txt 
python3 run.py --algorithm dynperc --dataset brightkite         --batch 1   -o p48_q1_cpu_brightkite.txt
python3 run.py --algorithm dynperc --dataset brightkite         --batch 10  -o p48_q10_cpu_brightkite.txt
python3 run.py --algorithm dynperc --dataset brightkite         --batch 40  -o p48_q40_cpu_brightkite.txt
python3 run.py --algorithm dynperc --dataset brightkite         --batch 100 -o p48_q100_cpu_brightkite.txt
python3 run.py --algorithm dynperc --dataset email-enron        --batch 1   -o p48_q1_cpu_email-enron.txt
python3 run.py --algorithm dynperc --dataset email-enron        --batch 10  -o p48_q10_cpu_email-enron.txt
python3 run.py --algorithm dynperc --dataset email-enron        --batch 140 -o p48_q40_cpu_email-enron.txt
python3 run.py --algorithm dynperc --dataset email-enron        --batch 100 -o p48_q100_cpu_email-enron.txt
python3 run.py --algorithm dynperc --dataset facebook           --batch 1   -o p48_q1_cpu_facebook.txt
python3 run.py --algorithm dynperc --dataset facebook           --batch 10  -o p48_q10_cpu_facebook.txt
python3 run.py --algorithm dynperc --dataset facebook           --batch 40  -o p48_q40_cpu_facebook.txt
python3 run.py --algorithm dynperc --dataset facebook           --batch 100 -o p48_q100_cpu_facebook.txt
python3 run.py --algorithm dynperc --dataset hi2010             --batch 1   -o p48_q1_cpu_hi2010.txt
python3 run.py --algorithm dynperc --dataset hi2010             --batch 10  -o p48_q10_cpu_hi2010.txt
python3 run.py --algorithm dynperc --dataset hi2010             --batch 40  -o p48_q40_cpu_hi2010.txt
python3 run.py --algorithm dynperc --dataset hi2010             --batch 100 -o p48_q100_cpu_hi2010.txt
python3 run.py --algorithm dynperc --dataset p2p-Gnutella24     --batch 1   -o p48_q1_cpu_p2p-Gnutella24.txt
python3 run.py --algorithm dynperc --dataset p2p-Gnutella24     --batch 10  -o p48_q10_cpu_p2p-Gnutella24.txt
python3 run.py --algorithm dynperc --dataset p2p-Gnutella24     --batch 40  -o p48_q40_cpu_p2p-Gnutella24.txt
python3 run.py --algorithm dynperc --dataset p2p-Gnutella24     --batch 100 -o p48_q100_cpu_p2p-Gnutella24.txt
python3 run.py --algorithm dynperc --dataset p2p-Gnutella25     --batch 1   -o p48_q1_cpu_p2p-Gnutella25.txt
python3 run.py --algorithm dynperc --dataset p2p-Gnutella25     --batch 10  -o p48_q10_cpu_p2p-Gnutella25.txt
python3 run.py --algorithm dynperc --dataset p2p-Gnutella25     --batch 40  -o p48_q40_cpu_p2p-Gnutella25.txt
python3 run.py --algorithm dynperc --dataset p2p-Gnutella25     --batch 100 -o p48_q100_cpu_p2p-Gnutella25.txt
python3 run.py --algorithm dynperc --dataset p2p-Gnutella30     --batch 1   -o p48_q1_cpu_p2p-Gnutella30.txt
python3 run.py --algorithm dynperc --dataset p2p-Gnutella30     --batch 10  -o p48_q10_cpu_p2p-Gnutella30.txt
python3 run.py --algorithm dynperc --dataset p2p-Gnutella30     --batch 40  -o p48_q40_cpu_p2p-Gnutella30.txt
python3 run.py --algorithm dynperc --dataset p2p-Gnutella30     --batch 100 -o p48_q100_cpu_p2p-Gnutella30.txt
python3 run.py --algorithm dynperc --dataset p2p-PGPgiantcompo  --batch 1   -o p48_q1_cpu_p2p-PGPgiantcompo.txt
python3 run.py --algorithm dynperc --dataset p2p-PGPgiantcompo  --batch 10  -o p48_q10_cpu_p2p-PGPgiantcompo.txt
python3 run.py --algorithm dynperc --dataset p2p-PGPgiantcompo  --batch 40  -o p48_q40_cpu_p2p-PGPgiantcompo.txt
python3 run.py --algorithm dynperc --dataset p2p-PGPgiantcompo  --batch 100 -o p48_q100_cpu_p2p-PGPgiantcompo.txt
python3 run.py --algorithm dynperc --dataset slashdot           --batch 1   -o p48_q1_cpu_slashdot.txt
python3 run.py --algorithm dynperc --dataset slashdot           --batch 10  -o p48_q10_cpu_slashdot.txt
python3 run.py --algorithm dynperc --dataset slashdot           --batch 40  -o p48_q40_cpu_slashdot.txt
python3 run.py --algorithm dynperc --dataset slashdot           --batch 100 -o p48_q100_cpu_slashdot.txt
python3 run.py --algorithm dynperc --dataset web-indochina-2004 --batch 1   -o p48_q1_cpu_web-indochina-2004.txt
python3 run.py --algorithm dynperc --dataset web-indochina-2004 --batch 10  -o p48_q10_cpu_web-indochina-2004.txt
python3 run.py --algorithm dynperc --dataset web-indochina-2004 --batch 40  -o p48_q40_cpu_web-indochina-2004.txt
python3 run.py --algorithm dynperc --dataset web-indochina-2004 --batch 100 -o p48_q100_cpu_web-indochina-2004.txt
python3 run.py --algorithm dynperc --dataset web-standford      --batch 1   -o p48_q1_cpu_web-standford.txt
python3 run.py --algorithm dynperc --dataset web-standford      --batch 10  -o p48_q10_cpu_web-standford.txt
python3 run.py --algorithm dynperc --dataset web-standford      --batch 40  -o p48_q40_cpu_web-standford.txt
python3 run.py --algorithm dynperc --dataset web-standford      --batch 100 -o p48_q100_cpu_web-standford.txt
python3 run.py --algorithm dynperc --dataset web-webbase-2001   --batch 1   -o p48_q1_cpu_web-webbase-2001.txt
python3 run.py --algorithm dynperc --dataset web-webbase-2001   --batch 10  -o p48_q10_cpu_web-webbase-2001.txt
python3 run.py --algorithm dynperc --dataset web-webbase-2001   --batch 40  -o p48_q40_cpu_web-webbase-2001.txt
python3 run.py --algorithm dynperc --dataset web-webbase-2001   --batch 100 -o p48_q100_cpu_web-webbase-2001.txt
python3 run.py --algorithm dynperc --dataset wikiVote           --batch 1   -o p48_q1_cpu_wikiVote.txt
python3 run.py --algorithm dynperc --dataset wikiVote           --batch 10  -o p48_q10_cpu_wikiVote.txt
python3 run.py --algorithm dynperc --dataset wikiVote           --batch 40  -o p48_q40_cpu_wikiVote.txt
python3 run.py --algorithm dynperc --dataset wikiVote           --batch 100 -o p48_q100_cpu_wikiVote.txt





