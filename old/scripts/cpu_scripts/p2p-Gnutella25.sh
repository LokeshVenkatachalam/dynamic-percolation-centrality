g++ -O3 -fopenmp -lstdc++ ./src/CPU/dynamic-edge-update.cpp -o ./exec/CPU/deu
output=p2p-Gnutella25_cpu_dynedge.txt  
python3 run.py --algorithm dynedge --dataset p2p-Gnutella25 --numthread 128 --batch 10    -o p128_q10_cpu_dynedge_p2p-Gnutella25.txt    &>> $output
python3 run.py --algorithm dynedge --dataset p2p-Gnutella25 --numthread 128 --batch 100   -o p128_q100_cpu_dynedge_p2p-Gnutella25.txt   &>> $output
python3 run.py --algorithm dynedge --dataset p2p-Gnutella25 --numthread 128 --batch 1000  -o p128_q1000_cpu_dynedge_p2p-Gnutella25.txt  &>> $output
python3 run.py --algorithm dynedge --dataset p2p-Gnutella25 --numthread 128 --batch 10000 -o p128_q10000_cpu_dynedge_p2p-Gnutella25.txt &>> $output
python3 run.py --algorithm dynedge --dataset p2p-Gnutella25 --numthread 64  --batch 10    -o p64_q10_cpu_dynedge_p2p-Gnutella25.txt     &>> $output
python3 run.py --algorithm dynedge --dataset p2p-Gnutella25 --numthread 64  --batch 100   -o p64_q100_cpu_dynedge_p2p-Gnutella25.txt    &>> $output
python3 run.py --algorithm dynedge --dataset p2p-Gnutella25 --numthread 64  --batch 1000  -o p64_q1000_cpu_dynedge_p2p-Gnutella25.txt   &>> $output
python3 run.py --algorithm dynedge --dataset p2p-Gnutella25 --numthread 64  --batch 10000 -o p64_q10000_cpu_dynedge_p2p-Gnutella25.txt  &>> $output
python3 run.py --algorithm dynedge --dataset p2p-Gnutella25 --numthread 16  --batch 10    -o p16_q10_cpu_dynedge_p2p-Gnutella25.txt     &>> $output
python3 run.py --algorithm dynedge --dataset p2p-Gnutella25 --numthread 16  --batch 100   -o p16_q100_cpu_dynedge_p2p-Gnutella25.txt    &>> $output
python3 run.py --algorithm dynedge --dataset p2p-Gnutella25 --numthread 16  --batch 1000  -o p16_q1000_cpu_dynedge_p2p-Gnutella25.txt   &>> $output
python3 run.py --algorithm dynedge --dataset p2p-Gnutella25 --numthread 16  --batch 10000 -o p16_q10000_cpu_dynedge_p2p-Gnutella25.txt  &>> $output
python3 run.py --algorithm dynedge --dataset p2p-Gnutella25 --numthread 4   --batch 10    -o p4_q10_cpu_dynedge_p2p-Gnutella25.txt      &>> $output
python3 run.py --algorithm dynedge --dataset p2p-Gnutella25 --numthread 4   --batch 100   -o p4_q100_cpu_dynedge_p2p-Gnutella25.txt     &>> $output
python3 run.py --algorithm dynedge --dataset p2p-Gnutella25 --numthread 4   --batch 1000  -o p4_q1000_cpu_dynedge_p2p-Gnutella25.txt    &>> $output
python3 run.py --algorithm dynedge --dataset p2p-Gnutella25 --numthread 4   --batch 10000 -o p4_q10000_cpu_dynedge_p2p-Gnutella25.txt   &>> $output
python3 run.py --algorithm dynedge --dataset p2p-Gnutella25 --numthread 1   --batch 10    -o p1_q10_cpu_dynedge_p2p-Gnutella25.txt      &>> $output
python3 run.py --algorithm dynedge --dataset p2p-Gnutella25 --numthread 1   --batch 100   -o p1_q100_cpu_dynedge_p2p-Gnutella25.txt     &>> $output
python3 run.py --algorithm dynedge --dataset p2p-Gnutella25 --numthread 1   --batch 1000  -o p1_q1000_cpu_dynedge_p2p-Gnutella25.txt    &>> $output
python3 run.py --algorithm dynedge --dataset p2p-Gnutella25 --numthread 1   --batch 10000 -o p1_q10000_cpu_dynedge_p2p-Gnutella25.txt   &>> $output

g++ -O3 -fopenmp -lstdc++ ./src/CPU/static-edge-update.cpp -o ./exec/CPU/seu
output=p2p-Gnutella25_cpu_statedge.txt  

python3 run.py --algorithm statedge --dataset p2p-Gnutella25 --numthread 128 --batch 10    -o p128_q10_cpu_statedge_p2p-Gnutella25.txt    &>> $output
python3 run.py --algorithm statedge --dataset p2p-Gnutella25 --numthread 128 --batch 100   -o p128_q100_cpu_statedge_p2p-Gnutella25.txt   &>> $output
python3 run.py --algorithm statedge --dataset p2p-Gnutella25 --numthread 128 --batch 1000  -o p128_q1000_cpu_statedge_p2p-Gnutella25.txt  &>> $output
python3 run.py --algorithm statedge --dataset p2p-Gnutella25 --numthread 128 --batch 10000 -o p128_q10000_cpu_statedge_p2p-Gnutella25.txt &>> $output
python3 run.py --algorithm statedge --dataset p2p-Gnutella25 --numthread 64  --batch 10    -o p64_q10_cpu_statedge_p2p-Gnutella25.txt     &>> $output
python3 run.py --algorithm statedge --dataset p2p-Gnutella25 --numthread 64  --batch 100   -o p64_q100_cpu_statedge_p2p-Gnutella25.txt    &>> $output
python3 run.py --algorithm statedge --dataset p2p-Gnutella25 --numthread 64  --batch 1000  -o p64_q1000_cpu_statedge_p2p-Gnutella25.txt   &>> $output
python3 run.py --algorithm statedge --dataset p2p-Gnutella25 --numthread 64  --batch 10000 -o p64_q10000_cpu_statedge_p2p-Gnutella25.txt  &>> $output
python3 run.py --algorithm statedge --dataset p2p-Gnutella25 --numthread 16  --batch 10    -o p16_q10_cpu_statedge_p2p-Gnutella25.txt     &>> $output
python3 run.py --algorithm statedge --dataset p2p-Gnutella25 --numthread 16  --batch 100   -o p16_q100_cpu_statedge_p2p-Gnutella25.txt    &>> $output
python3 run.py --algorithm statedge --dataset p2p-Gnutella25 --numthread 16  --batch 1000  -o p16_q1000_cpu_statedge_p2p-Gnutella25.txt   &>> $output
python3 run.py --algorithm statedge --dataset p2p-Gnutella25 --numthread 16  --batch 10000 -o p16_q10000_cpu_statedge_p2p-Gnutella25.txt  &>> $output
python3 run.py --algorithm statedge --dataset p2p-Gnutella25 --numthread 4   --batch 10    -o p4_q10_cpu_statedge_p2p-Gnutella25.txt      &>> $output
python3 run.py --algorithm statedge --dataset p2p-Gnutella25 --numthread 4   --batch 100   -o p4_q100_cpu_statedge_p2p-Gnutella25.txt     &>> $output
python3 run.py --algorithm statedge --dataset p2p-Gnutella25 --numthread 4   --batch 1000  -o p4_q1000_cpu_statedge_p2p-Gnutella25.txt    &>> $output
python3 run.py --algorithm statedge --dataset p2p-Gnutella25 --numthread 4   --batch 10000 -o p4_q10000_cpu_statedge_p2p-Gnutella25.txt   &>> $output
python3 run.py --algorithm statedge --dataset p2p-Gnutella25 --numthread 1   --batch 10    -o p1_q10_cpu_statedge_p2p-Gnutella25.txt      &>> $output
python3 run.py --algorithm statedge --dataset p2p-Gnutella25 --numthread 1   --batch 100   -o p1_q100_cpu_statedge_p2p-Gnutella25.txt     &>> $output
python3 run.py --algorithm statedge --dataset p2p-Gnutella25 --numthread 1   --batch 1000  -o p1_q1000_cpu_statedge_p2p-Gnutella25.txt    &>> $output
python3 run.py --algorithm statedge --dataset p2p-Gnutella25 --numthread 1   --batch 10000 -o p1_q10000_cpu_statedge_p2p-Gnutella25.txt   &>> $output

