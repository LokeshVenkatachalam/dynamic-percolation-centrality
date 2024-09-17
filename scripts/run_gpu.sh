nvcc ./src/GPU/dynamic-percolation-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/dpu
output=PGPgiantcompo_gpu_dynperc.txt  
python3 run.py --algorithm dynperc --dataset PGPgiantcompo         --gpu --batch 1   -o p64_q1_gpu_dynperc_PGPgiantcompo.txt            &>> $output
python3 run.py --algorithm dynperc --dataset PGPgiantcompo         --gpu --batch 10  -o p64_q10_gpu_dynperc_PGPgiantcompo.txt           &>> $output
python3 run.py --algorithm dynperc --dataset PGPgiantcompo         --gpu --batch 40  -o p64_q40_gpu_dynperc_PGPgiantcompo.txt           &>> $output
python3 run.py --algorithm dynperc --dataset PGPgiantcompo         --gpu --batch 100 -o p64_q100_gpu_dynperc_PGPgiantcompo.txt          &>> $output
nvcc ./src/GPU/static-percolation-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/spu
output=PGPgiantcompo_gpu_statperc.txt  
python3 run.py --algorithm statperc --dataset PGPgiantcompo         --gpu --batch 1   -o p64_q1_gpu_statperc_PGPgiantcompo.txt            &>> $output
python3 run.py --algorithm statperc --dataset PGPgiantcompo         --gpu --batch 10  -o p64_q10_gpu_statperc_PGPgiantcompo.txt           &>> $output
python3 run.py --algorithm statperc --dataset PGPgiantcompo         --gpu --batch 40  -o p64_q40_gpu_statperc_PGPgiantcompo.txt           &>> $output
python3 run.py --algorithm statperc --dataset PGPgiantcompo         --gpu --batch 100 -o p64_q100_gpu_statperc_PGPgiantcompo.txt          &>> $output
nvcc ./src/GPU/dynamic-edge-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/deu
output=PGPgiantcompo_gpu_dynedge.txt  
python3 run.py --algorithm dynedge --dataset PGPgiantcompo         --gpu --batch 1   -o p64_q1_gpu_dynedge_PGPgiantcompo.txt            &>> $output
python3 run.py --algorithm dynedge --dataset PGPgiantcompo         --gpu --batch 10  -o p64_q10_gpu_dynedge_PGPgiantcompo.txt           &>> $output
python3 run.py --algorithm dynedge --dataset PGPgiantcompo         --gpu --batch 40  -o p64_q40_gpu_dynedge_PGPgiantcompo.txt           &>> $output
python3 run.py --algorithm dynedge --dataset PGPgiantcompo         --gpu --batch 100 -o p64_q100_gpu_dynedge_PGPgiantcompo.txt          &>> $output
nvcc ./src/GPU/static-edge-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/seu
output=PGPgiantcompo_gpu_statedge.txt  
python3 run.py --algorithm statedge --dataset PGPgiantcompo         --gpu --batch 1   -o p64_q1_gpu_statedge_PGPgiantcompo.txt            &>> $output
python3 run.py --algorithm statedge --dataset PGPgiantcompo         --gpu --batch 10  -o p64_q10_gpu_statedge_PGPgiantcompo.txt           &>> $output
python3 run.py --algorithm statedge --dataset PGPgiantcompo         --gpu --batch 40  -o p64_q40_gpu_statedge_PGPgiantcompo.txt           &>> $output
python3 run.py --algorithm statedge --dataset PGPgiantcompo         --gpu --batch 100 -o p64_q100_gpu_statedge_PGPgiantcompo.txt          &>> $output
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
nvcc ./src/GPU/dynamic-percolation-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/dpu
output=web-indochina-2004_gpu_dynperc.txt  
python3 run.py --algorithm dynperc --dataset web-indochina-2004         --gpu --batch 1   -o p64_q1_gpu_dynperc_web-indochina-2004.txt            &>> $output
python3 run.py --algorithm dynperc --dataset web-indochina-2004         --gpu --batch 10  -o p64_q10_gpu_dynperc_web-indochina-2004.txt           &>> $output
python3 run.py --algorithm dynperc --dataset web-indochina-2004         --gpu --batch 40  -o p64_q40_gpu_dynperc_web-indochina-2004.txt           &>> $output
python3 run.py --algorithm dynperc --dataset web-indochina-2004         --gpu --batch 100 -o p64_q100_gpu_dynperc_web-indochina-2004.txt          &>> $output
nvcc ./src/GPU/static-percolation-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/spu
output=web-indochina-2004_gpu_statperc.txt  
python3 run.py --algorithm statperc --dataset web-indochina-2004         --gpu --batch 1   -o p64_q1_gpu_statperc_web-indochina-2004.txt            &>> $output
python3 run.py --algorithm statperc --dataset web-indochina-2004         --gpu --batch 10  -o p64_q10_gpu_statperc_web-indochina-2004.txt           &>> $output
python3 run.py --algorithm statperc --dataset web-indochina-2004         --gpu --batch 40  -o p64_q40_gpu_statperc_web-indochina-2004.txt           &>> $output
python3 run.py --algorithm statperc --dataset web-indochina-2004         --gpu --batch 100 -o p64_q100_gpu_statperc_web-indochina-2004.txt          &>> $output
nvcc ./src/GPU/dynamic-edge-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/deu
output=web-indochina-2004_gpu_dynedge.txt  
python3 run.py --algorithm dynedge --dataset web-indochina-2004         --gpu --batch 1   -o p64_q1_gpu_dynedge_web-indochina-2004.txt            &>> $output
python3 run.py --algorithm dynedge --dataset web-indochina-2004         --gpu --batch 10  -o p64_q10_gpu_dynedge_web-indochina-2004.txt           &>> $output
python3 run.py --algorithm dynedge --dataset web-indochina-2004         --gpu --batch 40  -o p64_q40_gpu_dynedge_web-indochina-2004.txt           &>> $output
python3 run.py --algorithm dynedge --dataset web-indochina-2004         --gpu --batch 100 -o p64_q100_gpu_dynedge_web-indochina-2004.txt          &>> $output
nvcc ./src/GPU/static-edge-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/seu
output=web-indochina-2004_gpu_statedge.txt  
python3 run.py --algorithm statedge --dataset web-indochina-2004         --gpu --batch 1   -o p64_q1_gpu_statedge_web-indochina-2004.txt            &>> $output
python3 run.py --algorithm statedge --dataset web-indochina-2004         --gpu --batch 10  -o p64_q10_gpu_statedge_web-indochina-2004.txt           &>> $output
python3 run.py --algorithm statedge --dataset web-indochina-2004         --gpu --batch 40  -o p64_q40_gpu_statedge_web-indochina-2004.txt           &>> $output
python3 run.py --algorithm statedge --dataset web-indochina-2004         --gpu --batch 100 -o p64_q100_gpu_statedge_web-indochina-2004.txt          &>> $output
nvcc ./src/GPU/dynamic-percolation-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/dpu
output=p2p-Gnutella25_gpu_dynperc.txt  
python3 run.py --algorithm dynperc --dataset p2p-Gnutella25         --gpu --batch 1   -o p64_q1_gpu_dynperc_p2p-Gnutella25.txt            &>> $output
python3 run.py --algorithm dynperc --dataset p2p-Gnutella25         --gpu --batch 10  -o p64_q10_gpu_dynperc_p2p-Gnutella25.txt           &>> $output
python3 run.py --algorithm dynperc --dataset p2p-Gnutella25         --gpu --batch 40  -o p64_q40_gpu_dynperc_p2p-Gnutella25.txt           &>> $output
python3 run.py --algorithm dynperc --dataset p2p-Gnutella25         --gpu --batch 100 -o p64_q100_gpu_dynperc_p2p-Gnutella25.txt          &>> $output
nvcc ./src/GPU/static-percolation-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/spu
output=p2p-Gnutella25_gpu_statperc.txt  
python3 run.py --algorithm statperc --dataset p2p-Gnutella25         --gpu --batch 1   -o p64_q1_gpu_statperc_p2p-Gnutella25.txt            &>> $output
python3 run.py --algorithm statperc --dataset p2p-Gnutella25         --gpu --batch 10  -o p64_q10_gpu_statperc_p2p-Gnutella25.txt           &>> $output
python3 run.py --algorithm statperc --dataset p2p-Gnutella25         --gpu --batch 40  -o p64_q40_gpu_statperc_p2p-Gnutella25.txt           &>> $output
python3 run.py --algorithm statperc --dataset p2p-Gnutella25         --gpu --batch 100 -o p64_q100_gpu_statperc_p2p-Gnutella25.txt          &>> $output
nvcc ./src/GPU/dynamic-edge-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/deu
output=p2p-Gnutella25_gpu_dynedge.txt  
python3 run.py --algorithm dynedge --dataset p2p-Gnutella25         --gpu --batch 1   -o p64_q1_gpu_dynedge_p2p-Gnutella25.txt            &>> $output
python3 run.py --algorithm dynedge --dataset p2p-Gnutella25         --gpu --batch 10  -o p64_q10_gpu_dynedge_p2p-Gnutella25.txt           &>> $output
python3 run.py --algorithm dynedge --dataset p2p-Gnutella25         --gpu --batch 40  -o p64_q40_gpu_dynedge_p2p-Gnutella25.txt           &>> $output
python3 run.py --algorithm dynedge --dataset p2p-Gnutella25         --gpu --batch 100 -o p64_q100_gpu_dynedge_p2p-Gnutella25.txt          &>> $output
nvcc ./src/GPU/static-edge-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/seu
output=p2p-Gnutella25_gpu_statedge.txt  
python3 run.py --algorithm statedge --dataset p2p-Gnutella25         --gpu --batch 1   -o p64_q1_gpu_statedge_p2p-Gnutella25.txt            &>> $output
python3 run.py --algorithm statedge --dataset p2p-Gnutella25         --gpu --batch 10  -o p64_q10_gpu_statedge_p2p-Gnutella25.txt           &>> $output
python3 run.py --algorithm statedge --dataset p2p-Gnutella25         --gpu --batch 40  -o p64_q40_gpu_statedge_p2p-Gnutella25.txt           &>> $output
python3 run.py --algorithm statedge --dataset p2p-Gnutella25         --gpu --batch 100 -o p64_q100_gpu_statedge_p2p-Gnutella25.txt          &>> $output
nvcc ./src/GPU/dynamic-percolation-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/dpu
output=p2p-Gnutella30_gpu_dynperc.txt  
python3 run.py --algorithm dynperc --dataset p2p-Gnutella30         --gpu --batch 1   -o p64_q1_gpu_dynperc_p2p-Gnutella30.txt            &>> $output
python3 run.py --algorithm dynperc --dataset p2p-Gnutella30         --gpu --batch 10  -o p64_q10_gpu_dynperc_p2p-Gnutella30.txt           &>> $output
python3 run.py --algorithm dynperc --dataset p2p-Gnutella30         --gpu --batch 40  -o p64_q40_gpu_dynperc_p2p-Gnutella30.txt           &>> $output
python3 run.py --algorithm dynperc --dataset p2p-Gnutella30         --gpu --batch 100 -o p64_q100_gpu_dynperc_p2p-Gnutella30.txt          &>> $output
nvcc ./src/GPU/static-percolation-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/spu
output=p2p-Gnutella30_gpu_statperc.txt  
python3 run.py --algorithm statperc --dataset p2p-Gnutella30         --gpu --batch 1   -o p64_q1_gpu_statperc_p2p-Gnutella30.txt            &>> $output
python3 run.py --algorithm statperc --dataset p2p-Gnutella30         --gpu --batch 10  -o p64_q10_gpu_statperc_p2p-Gnutella30.txt           &>> $output
python3 run.py --algorithm statperc --dataset p2p-Gnutella30         --gpu --batch 40  -o p64_q40_gpu_statperc_p2p-Gnutella30.txt           &>> $output
python3 run.py --algorithm statperc --dataset p2p-Gnutella30         --gpu --batch 100 -o p64_q100_gpu_statperc_p2p-Gnutella30.txt          &>> $output
nvcc ./src/GPU/dynamic-edge-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/deu
output=p2p-Gnutella30_gpu_dynedge.txt  
python3 run.py --algorithm dynedge --dataset p2p-Gnutella30         --gpu --batch 1   -o p64_q1_gpu_dynedge_p2p-Gnutella30.txt            &>> $output
python3 run.py --algorithm dynedge --dataset p2p-Gnutella30         --gpu --batch 10  -o p64_q10_gpu_dynedge_p2p-Gnutella30.txt           &>> $output
python3 run.py --algorithm dynedge --dataset p2p-Gnutella30         --gpu --batch 40  -o p64_q40_gpu_dynedge_p2p-Gnutella30.txt           &>> $output
python3 run.py --algorithm dynedge --dataset p2p-Gnutella30         --gpu --batch 100 -o p64_q100_gpu_dynedge_p2p-Gnutella30.txt          &>> $output
nvcc ./src/GPU/static-edge-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/seu
output=p2p-Gnutella30_gpu_statedge.txt  
python3 run.py --algorithm statedge --dataset p2p-Gnutella30         --gpu --batch 1   -o p64_q1_gpu_statedge_p2p-Gnutella30.txt            &>> $output
python3 run.py --algorithm statedge --dataset p2p-Gnutella30         --gpu --batch 10  -o p64_q10_gpu_statedge_p2p-Gnutella30.txt           &>> $output
python3 run.py --algorithm statedge --dataset p2p-Gnutella30         --gpu --batch 40  -o p64_q40_gpu_statedge_p2p-Gnutella30.txt           &>> $output
python3 run.py --algorithm statedge --dataset p2p-Gnutella30         --gpu --batch 100 -o p64_q100_gpu_statedge_p2p-Gnutella30.txt          &>> $output
nvcc ./src/GPU/dynamic-percolation-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/dpu
output=slashdot_gpu_dynperc.txt  
python3 run.py --algorithm dynperc --dataset slashdot         --gpu --batch 1   -o p64_q1_gpu_dynperc_slashdot.txt            &>> $output
python3 run.py --algorithm dynperc --dataset slashdot         --gpu --batch 10  -o p64_q10_gpu_dynperc_slashdot.txt           &>> $output
python3 run.py --algorithm dynperc --dataset slashdot         --gpu --batch 40  -o p64_q40_gpu_dynperc_slashdot.txt           &>> $output
python3 run.py --algorithm dynperc --dataset slashdot         --gpu --batch 100 -o p64_q100_gpu_dynperc_slashdot.txt          &>> $output
nvcc ./src/GPU/static-percolation-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/spu
output=slashdot_gpu_statperc.txt  
python3 run.py --algorithm statperc --dataset slashdot         --gpu --batch 1   -o p64_q1_gpu_statperc_slashdot.txt            &>> $output
python3 run.py --algorithm statperc --dataset slashdot         --gpu --batch 10  -o p64_q10_gpu_statperc_slashdot.txt           &>> $output
python3 run.py --algorithm statperc --dataset slashdot         --gpu --batch 40  -o p64_q40_gpu_statperc_slashdot.txt           &>> $output
python3 run.py --algorithm statperc --dataset slashdot         --gpu --batch 100 -o p64_q100_gpu_statperc_slashdot.txt          &>> $output
nvcc ./src/GPU/dynamic-edge-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/deu
output=slashdot_gpu_dynedge.txt  
python3 run.py --algorithm dynedge --dataset slashdot         --gpu --batch 1   -o p64_q1_gpu_dynedge_slashdot.txt            &>> $output
python3 run.py --algorithm dynedge --dataset slashdot         --gpu --batch 10  -o p64_q10_gpu_dynedge_slashdot.txt           &>> $output
python3 run.py --algorithm dynedge --dataset slashdot         --gpu --batch 40  -o p64_q40_gpu_dynedge_slashdot.txt           &>> $output
python3 run.py --algorithm dynedge --dataset slashdot         --gpu --batch 100 -o p64_q100_gpu_dynedge_slashdot.txt          &>> $output
nvcc ./src/GPU/static-edge-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/seu
output=slashdot_gpu_statedge.txt  
python3 run.py --algorithm statedge --dataset slashdot         --gpu --batch 1   -o p64_q1_gpu_statedge_slashdot.txt            &>> $output
python3 run.py --algorithm statedge --dataset slashdot         --gpu --batch 10  -o p64_q10_gpu_statedge_slashdot.txt           &>> $output
python3 run.py --algorithm statedge --dataset slashdot         --gpu --batch 40  -o p64_q40_gpu_statedge_slashdot.txt           &>> $output
python3 run.py --algorithm statedge --dataset slashdot         --gpu --batch 100 -o p64_q100_gpu_statedge_slashdot.txt          &>> $output
output=email-enron_gpu_dynperc.txt  
python3 run.py --algorithm dynperc --dataset email-enron         --gpu --batch 1   -o p64_q1_gpu_dynperc_email-enron.txt            &>> $output
python3 run.py --algorithm dynperc --dataset email-enron         --gpu --batch 10  -o p64_q10_gpu_dynperc_email-enron.txt           &>> $output
python3 run.py --algorithm dynperc --dataset email-enron         --gpu --batch 40  -o p64_q40_gpu_dynperc_email-enron.txt           &>> $output
python3 run.py --algorithm dynperc --dataset email-enron         --gpu --batch 100 -o p64_q100_gpu_dynperc_email-enron.txt          &>> $output
nvcc ./src/GPU/static-percolation-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/spu
output=email-enron_gpu_statperc.txt  
python3 run.py --algorithm statperc --dataset email-enron         --gpu --batch 1   -o p64_q1_gpu_statperc_email-enron.txt            &>> $output
python3 run.py --algorithm statperc --dataset email-enron         --gpu --batch 10  -o p64_q10_gpu_statperc_email-enron.txt           &>> $output
python3 run.py --algorithm statperc --dataset email-enron         --gpu --batch 40  -o p64_q40_gpu_statperc_email-enron.txt           &>> $output
python3 run.py --algorithm statperc --dataset email-enron         --gpu --batch 100 -o p64_q100_gpu_statperc_email-enron.txt          &>> $output
nvcc ./src/GPU/dynamic-edge-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/deu
output=email-enron_gpu_dynedge.txt  
python3 run.py --algorithm dynedge --dataset email-enron         --gpu --batch 1   -o p64_q1_gpu_dynedge_email-enron.txt            &>> $output
python3 run.py --algorithm dynedge --dataset email-enron         --gpu --batch 10  -o p64_q10_gpu_dynedge_email-enron.txt           &>> $output
python3 run.py --algorithm dynedge --dataset email-enron         --gpu --batch 40  -o p64_q40_gpu_dynedge_email-enron.txt           &>> $output
python3 run.py --algorithm dynedge --dataset email-enron         --gpu --batch 100 -o p64_q100_gpu_dynedge_email-enron.txt          &>> $output
nvcc ./src/GPU/static-edge-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/seu
output=email-enron_gpu_statedge.txt  
python3 run.py --algorithm statedge --dataset email-enron         --gpu --batch 1   -o p64_q1_gpu_statedge_email-enron.txt            &>> $output
python3 run.py --algorithm statedge --dataset email-enron         --gpu --batch 10  -o p64_q10_gpu_statedge_email-enron.txt           &>> $output
python3 run.py --algorithm statedge --dataset email-enron         --gpu --batch 40  -o p64_q40_gpu_statedge_email-enron.txt           &>> $output
python3 run.py --algorithm statedge --dataset email-enron         --gpu --batch 100 -o p64_q100_gpu_statedge_email-enron.txt          &>> $output
nvcc ./src/GPU/dynamic-percolation-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/dpu
output=brightkite_gpu_dynperc.txt  
python3 run.py --algorithm dynperc --dataset brightkite         --gpu --batch 1   -o p64_q1_gpu_dynperc_brightkite.txt            &>> $output
python3 run.py --algorithm dynperc --dataset brightkite         --gpu --batch 10  -o p64_q10_gpu_dynperc_brightkite.txt           &>> $output
python3 run.py --algorithm dynperc --dataset brightkite         --gpu --batch 40  -o p64_q40_gpu_dynperc_brightkite.txt           &>> $output
python3 run.py --algorithm dynperc --dataset brightkite         --gpu --batch 100 -o p64_q100_gpu_dynperc_brightkite.txt          &>> $output
nvcc ./src/GPU/static-percolation-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/spu
output=brightkite_gpu_statperc.txt  
python3 run.py --algorithm statperc --dataset brightkite         --gpu --batch 1   -o p64_q1_gpu_statperc_brightkite.txt            &>> $output
python3 run.py --algorithm statperc --dataset brightkite         --gpu --batch 10  -o p64_q10_gpu_statperc_brightkite.txt           &>> $output
python3 run.py --algorithm statperc --dataset brightkite         --gpu --batch 40  -o p64_q40_gpu_statperc_brightkite.txt           &>> $output
python3 run.py --algorithm statperc --dataset brightkite         --gpu --batch 100 -o p64_q100_gpu_statperc_brightkite.txt          &>> $output
nvcc ./src/GPU/dynamic-edge-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/deu
output=brightkite_gpu_dynedge.txt  
python3 run.py --algorithm dynedge --dataset brightkite         --gpu --batch 1   -o p64_q1_gpu_dynedge_brightkite.txt            &>> $output
python3 run.py --algorithm dynedge --dataset brightkite         --gpu --batch 10  -o p64_q10_gpu_dynedge_brightkite.txt           &>> $output
python3 run.py --algorithm dynedge --dataset brightkite         --gpu --batch 40  -o p64_q40_gpu_dynedge_brightkite.txt           &>> $output
python3 run.py --algorithm dynedge --dataset brightkite         --gpu --batch 100 -o p64_q100_gpu_dynedge_brightkite.txt          &>> $output
nvcc ./src/GPU/static-edge-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/seu
output=brightkite_gpu_statedge.txt  
python3 run.py --algorithm statedge --dataset brightkite         --gpu --batch 1   -o p64_q1_gpu_statedge_brightkite.txt            &>> $output
python3 run.py --algorithm statedge --dataset brightkite         --gpu --batch 10  -o p64_q10_gpu_statedge_brightkite.txt           &>> $output
python3 run.py --algorithm statedge --dataset brightkite         --gpu --batch 40  -o p64_q40_gpu_statedge_brightkite.txt           &>> $output
python3 run.py --algorithm statedge --dataset brightkite         --gpu --batch 100 -o p64_q100_gpu_statedge_brightkite.txt          &>> $output