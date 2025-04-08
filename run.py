from subprocess import run
import argparse
from sys import exit
from os.path import isfile, exists
from os import mkdir

parser = argparse.ArgumentParser(description='Compute percolation centrality on dynamic graphs with edge and vertex percolation value updates')
parser.add_argument('-a', '--algorithm', dest='algo',
                    default=['dynperc'], nargs=1,
                    help='dynperc - dynamic algorithm for vertex percolation update, \
                    	  statperc - static algorithm for vertex percolation update \
                    	  dynedge - dynamic algorithm for edge update \
                    	  statedge - static algorithm for edge update')

parser.add_argument('-d', '--dataset', dest='dataset',
                    default=['none'], nargs=1,
                    help='The dataset to run on. Dataset must be present in ./datasets subdirectory.\
                    	  Look at existing datasets for the input format')

parser.add_argument('-b', '--batch', dest='batch',
                    default=['1'], nargs=1,
                    help='Batch size of the update')

parser.add_argument('-n', '--numthread', dest='numthread',default=['32'],
					help='Number of threads to be used')

parser.add_argument('-o', '--outfile', dest='outfile',
                    default=['out.txt'], nargs=1,
                    help='Output file name')

parser.add_argument('-g', '--gpu', dest='gpuflag', action='store_true', default=False,
                    help='Run experiment of GPU (default: multicore CPU)')

parser.add_argument('-r', '--recompile', dest='compileflag', action='store_true',
                    help='Recompile executables')

#add an argument to take GPU device id
parser.add_argument('--gpuNo', dest='gpuNo', default=['0'], nargs=1,
					help='GPU device id')

args = parser.parse_args()
algo = args.algo[0]
dataset = args.dataset[0]
batch = args.batch[0]
outfile = args.outfile[0]	
gpuflag = args.gpuflag
compileflag = args.compileflag
numthread = args.numthread
gpu_device = ""

if gpuflag:
	gpuNo = args.gpuNo[0]
	if int(gpuNo) == 0:
		gpu_device = ""
	else:
		gpu_device = "CUDA_VISIBLE_DEVICES="+gpuNo+" "
	# run("export CUDA_VISIBLE_DEVICES="+gpuNo, shell=True, check=True)

if algo not in ['dynperc', 'statperc', 'dynedge', 'statedge']:
	exit('Error: Invalid algorithm.')

if batch not in ['1', '10', '25', '40', '50', '100','1000','5000','10000','100000']:
	exit('Error: Please try among following batch size - 1, 10, 25, 40, 50 , 100. 1000,5000, 10000 or 100000')

if not isfile("./datasets/"+dataset+".in"):
	exit('Error: Dataset not found.')

command_map = {
	('dynperc',False) : 'g++ -O3 -fopenmp -lstdc++ ./src/CPU/dynamic-percolation-update.cpp -o ./exec/CPU/dpu',
	('statperc',False) : 'g++ -O3 -fopenmp -lstdc++ ./src/CPU/static-percolation-update.cpp -o ./exec/CPU/spu',
	('dynedge',False) : 'g++ -O3 -fopenmp -lstdc++ ./src/CPU/dynamic-edge-update.cpp -o ./exec/CPU/deu',
	('statedge',False) : 'g++ -O3 -fopenmp -lstdc++ ./src/CPU/static-edge-update.cpp -o ./exec/CPU/seu',
	('dynperc',True) : 'nvcc ./src/GPU/dynamic-percolation-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/dpu',
	('statperc',True) : 'nvcc ./src/GPU/static-percolation-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/spu',
	('dynedge',True) : 'nvcc ./src/GPU/dynamic-edge-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/deu',
	('statedge',True) : 'nvcc ./src/GPU/static-edge-update.cu -arch=sm_70 -std=c++11 -Xcompiler -fopenmp -O3 -o ./exec/GPU/seu'
}

exec_map = {
	('dynperc',False) 	: './exec/CPU/dpu',
	('statperc',False) 	: './exec/CPU/spu',
	('dynedge',False) 	: './exec/CPU/deu',
	('statedge',False) 	: './exec/CPU/seu',
	('dynperc',True) 	: 	gpu_device + 	'./exec/GPU/dpu',
	('statperc',True) 	:	gpu_device +  	'./exec/GPU/spu',
	('dynedge',True) 	: 	gpu_device + 	'./exec/GPU/deu',
	('statedge',True) 	:	gpu_device +  	'./exec/GPU/seu'
}

if not exists('./exec'):
	mkdir('./exec')

if not exists('./exec/CPU'):
	mkdir('./exec/CPU')

if not exists('./exec/GPU'):
	mkdir('./exec/GPU')

if not exists('./output'):
	mkdir('./output')

if not isfile(exec_map[(algo,gpuflag)]) or compileflag:
	# print("Didn't find executable or recompile flag set.")
	# print("Compiling ...")
	run(command_map[(algo,gpuflag)], shell=True, check=True)
	# print("Finished Compiling")
# else:
# 	print("Found existing executables. Skipping compilation.")

# print("Running Algorithm {} on dataset {} on {}".format(algo, dataset, ['CPU','GPU'][int(gpuflag)]))
if algo == "dynperc" or algo == "statperc":
	run(exec_map[(algo,gpuflag)]+ " ./datasets/{}.in ./queries/percolation-update-queries/queries_{}/{}_queries ./output/{} {}".format(dataset, batch, dataset, outfile, numthread), shell=True, check=True)
if algo == "dynedge" or algo == "statedge":
# <<<<<<< Updated upstream
#     print("perf record -g "+exec_map[(algo,gpuflag)]+ " ./datasets/{}.in ./queries/edge-update-queries/queries_{}/{}_queries ./output/{} {}".format(dataset, batch, dataset, outfile, numthread))
# 	run("perf record -g "+exec_map[(algo,gpuflag)]+ " ./datasets/{}.in ./queries/edge-update-queries/queries_{}/{}_queries ./output/{} {}".format(dataset, batch, dataset, outfile, numthread), shell=True, check=True)

# =======
	run(exec_map[(algo,gpuflag)]+ " ./datasets/{}.in ./queries/edge-update-queries/queries_{}/{}_queries ./output/{} {}".format(dataset, batch, dataset, outfile, numthread), shell=True, check=True)
	# print("perf record -g "+exec_map[(algo,gpuflag)]+ " ./datasets/{}.in ./queries/edge-update-queries/queries_{}/{}_queries ./output/{} {}".format(dataset, batch, dataset, outfile, numthread))
	# run("perf record -g "+exec_map[(algo,gpuflag)]+ " ./datasets/{}.in ./queries/edge-update-queries/queries_{}/{}_queries ./output/{} {}".format(dataset, batch, dataset, outfile, numthread), shell=True, check=True)
	# run("compute-sanitizer --tool memcheck " + exec_map[(algo,gpuflag)]+ " ./datasets/{}.in ./queries/edge-update-queries/queries_{}/{}_queries ./output/{} {}".format(dataset, batch, dataset, outfile, numthread), shell=True, check=True)
# print("Successfully completed execution. Output can be found at ./output/{}".format(outfile))