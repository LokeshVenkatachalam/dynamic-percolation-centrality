g++ -O3 -fopenmp -lstdc++ ./src/CPU/dynamic-percolation-update.cpp -o ./exec/CPU/dpu
output=web-webbase-2001_cpu_dynperc.txt  
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 64 --batch 1   -o p64_q1_cpu_dynperc_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 64 --batch 10  -o p64_q10_cpu_dynperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 64 --batch 40  -o p64_q40_cpu_dynperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 64 --batch 100 -o p64_q100_cpu_dynperc_web-webbase-2001.txt          &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 48 --batch 1   -o p48_q1_cpu_dynperc_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 48 --batch 10  -o p48_q10_cpu_dynperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 48 --batch 40  -o p48_q40_cpu_dynperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 48 --batch 100 -o p48_q100_cpu_dynperc_web-webbase-2001.txt          &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 32 --batch 1   -o p32_q1_cpu_dynperc_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 32 --batch 10  -o p32_q10_cpu_dynperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 32 --batch 40  -o p32_q40_cpu_dynperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 32 --batch 100 -o p32_q100_cpu_dynperc_web-webbase-2001.txt          &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 16 --batch 1   -o p16_q1_cpu_dynperc_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 16 --batch 10  -o p16_q10_cpu_dynperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 16 --batch 40  -o p16_q40_cpu_dynperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 16 --batch 100 -o p16_q100_cpu_dynperc_web-webbase-2001.txt          &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 8 --batch 1   -o p8_q1_cpu_dynperc_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 8 --batch 10  -o p8_q10_cpu_dynperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 8 --batch 40  -o p8_q40_cpu_dynperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 8 --batch 100 -o p8_q100_cpu_dynperc_web-webbase-2001.txt          &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 4 --batch 1   -o p4_q1_cpu_dynperc_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 4 --batch 10  -o p4_q10_cpu_dynperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 4 --batch 40  -o p4_q40_cpu_dynperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 4 --batch 100 -o p4_q100_cpu_dynperc_web-webbase-2001.txt          &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 2 --batch 1   -o p2_q1_cpu_dynperc_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 2 --batch 10  -o p2_q10_cpu_dynperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 2 --batch 40  -o p2_q40_cpu_dynperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 2 --batch 100 -o p2_q100_cpu_dynperc_web-webbase-2001.txt          &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 1 --batch 1   -o p1_q1_cpu_dynperc_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 1 --batch 10  -o p1_q10_cpu_dynperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 1 --batch 40  -o p1_q40_cpu_dynperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --numthread 1 --batch 100 -o p1_q100_cpu_dynperc_web-webbase-2001.txt          &>> $output
g++ -O3 -fopenmp -lstdc++ ./src/CPU/static-percolation-update.cpp -o ./exec/CPU/spu
output=web-webbase-2001_cpu_statperc.txt  
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 64 --batch 1   -o p64_q1_cpu_statperc_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 64 --batch 10  -o p64_q10_cpu_statperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 64 --batch 40  -o p64_q40_cpu_statperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 64 --batch 100 -o p64_q100_cpu_statperc_web-webbase-2001.txt          &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 48 --batch 1   -o p48_q1_cpu_statperc_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 48 --batch 10  -o p48_q10_cpu_statperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 48 --batch 40  -o p48_q40_cpu_statperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 48 --batch 100 -o p48_q100_cpu_statperc_web-webbase-2001.txt          &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 32 --batch 1   -o p32_q1_cpu_statperc_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 32 --batch 10  -o p32_q10_cpu_statperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 32 --batch 40  -o p32_q40_cpu_statperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 32 --batch 100 -o p32_q100_cpu_statperc_web-webbase-2001.txt          &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 16 --batch 1   -o p16_q1_cpu_statperc_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 16 --batch 10  -o p16_q10_cpu_statperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 16 --batch 40  -o p16_q40_cpu_statperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 16 --batch 100 -o p16_q100_cpu_statperc_web-webbase-2001.txt          &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 8 --batch 1   -o p8_q1_cpu_statperc_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 8 --batch 10  -o p8_q10_cpu_statperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 8 --batch 40  -o p8_q40_cpu_statperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 8 --batch 100 -o p8_q100_cpu_statperc_web-webbase-2001.txt          &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 4 --batch 1   -o p4_q1_cpu_statperc_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 4 --batch 10  -o p4_q10_cpu_statperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 4 --batch 40  -o p4_q40_cpu_statperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 4 --batch 100 -o p4_q100_cpu_statperc_web-webbase-2001.txt          &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 2 --batch 1   -o p2_q1_cpu_statperc_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 2 --batch 10  -o p2_q10_cpu_statperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 2 --batch 40  -o p2_q40_cpu_statperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 2 --batch 100 -o p2_q100_cpu_statperc_web-webbase-2001.txt          &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 1 --batch 1   -o p1_q1_cpu_statperc_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 1 --batch 10  -o p1_q10_cpu_statperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 1 --batch 40  -o p1_q40_cpu_statperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --numthread 1 --batch 100 -o p1_q100_cpu_statperc_web-webbase-2001.txt          &>> $output
g++ -O3 -fopenmp -lstdc++ ./src/CPU/dynamic-edge-update.cpp -o ./exec/CPU/deu
output=web-webbase-2001_cpu_dynedge.txt  
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 64 --batch 1   -o p64_q1_cpu_dynedge_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 64 --batch 10  -o p64_q10_cpu_dynedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 64 --batch 40  -o p64_q40_cpu_dynedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 64 --batch 100 -o p64_q100_cpu_dynedge_web-webbase-2001.txt          &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 48 --batch 1   -o p48_q1_cpu_dynedge_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 48 --batch 10  -o p48_q10_cpu_dynedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 48 --batch 40  -o p48_q40_cpu_dynedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 48 --batch 100 -o p48_q100_cpu_dynedge_web-webbase-2001.txt          &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 32 --batch 1   -o p32_q1_cpu_dynedge_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 32 --batch 10  -o p32_q10_cpu_dynedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 32 --batch 40  -o p32_q40_cpu_dynedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 32 --batch 100 -o p32_q100_cpu_dynedge_web-webbase-2001.txt          &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 16 --batch 1   -o p16_q1_cpu_dynedge_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 16 --batch 10  -o p16_q10_cpu_dynedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 16 --batch 40  -o p16_q40_cpu_dynedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 16 --batch 100 -o p16_q100_cpu_dynedge_web-webbase-2001.txt          &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 8 --batch 1   -o p8_q1_cpu_dynedge_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 8 --batch 10  -o p8_q10_cpu_dynedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 8 --batch 40  -o p8_q40_cpu_dynedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 8 --batch 100 -o p8_q100_cpu_dynedge_web-webbase-2001.txt          &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 4 --batch 1   -o p4_q1_cpu_dynedge_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 4 --batch 10  -o p4_q10_cpu_dynedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 4 --batch 40  -o p4_q40_cpu_dynedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 4 --batch 100 -o p4_q100_cpu_dynedge_web-webbase-2001.txt          &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 2 --batch 1   -o p2_q1_cpu_dynedge_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 2 --batch 10  -o p2_q10_cpu_dynedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 2 --batch 40  -o p2_q40_cpu_dynedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 2 --batch 100 -o p2_q100_cpu_dynedge_web-webbase-2001.txt          &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 1 --batch 1   -o p1_q1_cpu_dynedge_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 1 --batch 10  -o p1_q10_cpu_dynedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 1 --batch 40  -o p1_q40_cpu_dynedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --numthread 1 --batch 100 -o p1_q100_cpu_dynedge_web-webbase-2001.txt          &>> $output
g++ -O3 -fopenmp -lstdc++ ./src/CPU/static-edge-update.cpp -o ./exec/CPU/seu
output=web-webbase-2001_cpu_statedge.txt  
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 64 --batch 1   -o p64_q1_cpu_statedge_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 64 --batch 10  -o p64_q10_cpu_statedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 64 --batch 40  -o p64_q40_cpu_statedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 64 --batch 100 -o p64_q100_cpu_statedge_web-webbase-2001.txt          &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 48 --batch 1   -o p48_q1_cpu_statedge_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 48 --batch 10  -o p48_q10_cpu_statedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 48 --batch 40  -o p48_q40_cpu_statedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 48 --batch 100 -o p48_q100_cpu_statedge_web-webbase-2001.txt          &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 32 --batch 1   -o p32_q1_cpu_statedge_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 32 --batch 10  -o p32_q10_cpu_statedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 32 --batch 40  -o p32_q40_cpu_statedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 32 --batch 100 -o p32_q100_cpu_statedge_web-webbase-2001.txt          &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 16 --batch 1   -o p16_q1_cpu_statedge_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 16 --batch 10  -o p16_q10_cpu_statedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 16 --batch 40  -o p16_q40_cpu_statedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 16 --batch 100 -o p16_q100_cpu_statedge_web-webbase-2001.txt          &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 8 --batch 1   -o p8_q1_cpu_statedge_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 8 --batch 10  -o p8_q10_cpu_statedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 8 --batch 40  -o p8_q40_cpu_statedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 8 --batch 100 -o p8_q100_cpu_statedge_web-webbase-2001.txt          &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 4 --batch 1   -o p4_q1_cpu_statedge_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 4 --batch 10  -o p4_q10_cpu_statedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 4 --batch 40  -o p4_q40_cpu_statedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 4 --batch 100 -o p4_q100_cpu_statedge_web-webbase-2001.txt          &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 2 --batch 1   -o p2_q1_cpu_statedge_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 2 --batch 10  -o p2_q10_cpu_statedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 2 --batch 40  -o p2_q40_cpu_statedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 2 --batch 100 -o p2_q100_cpu_statedge_web-webbase-2001.txt          &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 1 --batch 1   -o p1_q1_cpu_statedge_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 1 --batch 10  -o p1_q10_cpu_statedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 1 --batch 40  -o p1_q40_cpu_statedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --numthread 1 --batch 100 -o p1_q100_cpu_statedge_web-webbase-2001.txt          &>> $output
nvcc ./src/GPU/dynamic-percolation-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/dpu
output=web-webbase-2001_gpu_dynperc.txt  
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --gpu --batch 1   -o p64_q1_gpu_dynperc_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --gpu --batch 10  -o p64_q10_gpu_dynperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --gpu --batch 40  -o p64_q40_gpu_dynperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynperc --dataset web-webbase-2001         --gpu --batch 100 -o p64_q100_gpu_dynperc_web-webbase-2001.txt          &>> $output
nvcc ./src/GPU/static-percolation-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/spu
output=web-webbase-2001_gpu_statperc.txt  
python3 run.py --algorithm statperc --dataset web-webbase-2001         --gpu --batch 1   -o p64_q1_gpu_statperc_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --gpu --batch 10  -o p64_q10_gpu_statperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --gpu --batch 40  -o p64_q40_gpu_statperc_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statperc --dataset web-webbase-2001         --gpu --batch 100 -o p64_q100_gpu_statperc_web-webbase-2001.txt          &>> $output
nvcc ./src/GPU/dynamic-edge-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/deu
output=web-webbase-2001_gpu_dynedge.txt  
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --gpu --batch 1   -o p64_q1_gpu_dynedge_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --gpu --batch 10  -o p64_q10_gpu_dynedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --gpu --batch 40  -o p64_q40_gpu_dynedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001         --gpu --batch 100 -o p64_q100_gpu_dynedge_web-webbase-2001.txt          &>> $output
nvcc ./src/GPU/static-edge-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/seu
output=web-webbase-2001_gpu_statedge.txt  
python3 run.py --algorithm statedge --dataset web-webbase-2001         --gpu --batch 1   -o p64_q1_gpu_statedge_web-webbase-2001.txt            &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --gpu --batch 10  -o p64_q10_gpu_statedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --gpu --batch 40  -o p64_q40_gpu_statedge_web-webbase-2001.txt           &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001         --gpu --batch 100 -o p64_q100_gpu_statedge_web-webbase-2001.txt          &>> $output