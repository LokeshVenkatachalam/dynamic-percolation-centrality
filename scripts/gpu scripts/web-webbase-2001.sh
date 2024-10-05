nvcc ./src/GPU/dynamic-edge-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/deu
output=web-webbase-2001_gpu_dynedge.txt  
python3 run.py --algorithm dynedge --dataset web-webbase-2001   --gpu --batch 10       -o p64_q10_gpu_dynedge_web-webbase-2001.txt         --gpuNo 2  &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001   --gpu --batch 100      -o p64_q100_gpu_dynedge_web-webbase-2001.txt        --gpuNo 2  &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001   --gpu --batch 1000     -o p64_q1000_gpu_dynedge_web-webbase-2001.txt       --gpuNo 2  &>> $output
python3 run.py --algorithm dynedge --dataset web-webbase-2001   --gpu --batch 5000    -o p64_q5000_gpu_dynedge_web-webbase-2001.txt      --gpuNo 2  &>> $output
# python3 run.py --algorithm dynedge --dataset web-webbase-2001   --gpu --batch 100000   -o p64_q100000_gpu_dynedge_web-webbase-2001.txt     --gpuNo 2  &>> $output

nvcc ./src/GPU/static-edge-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/seu
output=web-webbase-2001_gpu_statedge.txt  
python3 run.py --algorithm statedge --dataset web-webbase-2001   --gpu --batch 10       -o p64_q10_gpu_statedge_web-webbase-2001.txt       --gpuNo 2  &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001   --gpu --batch 100      -o p64_q100_gpu_statedge_web-webbase-2001.txt      --gpuNo 2  &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001   --gpu --batch 1000     -o p64_q1000_gpu_statedge_web-webbase-2001.txt     --gpuNo 2  &>> $output
python3 run.py --algorithm statedge --dataset web-webbase-2001   --gpu --batch 5000    -o p64_q5000_gpu_statedge_web-webbase-2001.txt    --gpuNo 2  &>> $output
# python3 run.py --algorithm statedge --dataset web-webbase-2001   --gpu --batch 100000   -o p64_q100000_gpu_statedge_web-webbase-2001.txt   --gpuNo 2  &>> $output