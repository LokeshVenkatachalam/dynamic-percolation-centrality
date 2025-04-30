#!/bin/bash

# Ensure the script stops if any command fails
set -e

# Define parameter lists
DATASETS=("web-indochina-2004" "web-webbase-2001" "slashdot") # ("brightkite" "email-enron" "p2p-Gnutella25" "p2p-Gnutella30" "PGPgiantcompo" "slashdot" "web-indochina-2004" "web-webbase-2001")
BATCH_SIZES=(1 10 100 1000) #10000)
ALGORITHMS=("dynperc" "statperc")

# Define source and executable paths
SRC_DIR="./src/GPU"
EXEC_DIR="./exec/GPU"
OUTPUT_DIR="./output"

# Create directories if they don't exist
mkdir -p "$EXEC_DIR"
mkdir -p "$OUTPUT_DIR"

# Compile GPU executables for percolation
echo "Compiling GPU percolation executables..."
nvcc -arch=sm_80 -std=c++11 -Xcompiler -fopenmp -O3 "$SRC_DIR/dynamic-percolation-update.cu" -o "$EXEC_DIR/dpu"
nvcc -arch=sm_80 -std=c++11 -Xcompiler -fopenmp -O3 "$SRC_DIR/static-percolation-update.cu" -o "$EXEC_DIR/spu"
echo "Compilation finished."

# Loop through algorithms
for ALGO in "${ALGORITHMS[@]}"; do
    echo "Running algorithm: $ALGO on GPU"

    # Determine the correct executable suffix
    EXEC_SUFFIX=""
    if [ "$ALGO" == "dynperc" ]; then
        EXEC_SUFFIX="dpu"
    elif [ "$ALGO" == "statperc" ]; then
        EXEC_SUFFIX="spu"
    else
        echo "Unknown algorithm: $ALGO. Skipping."
        continue
    fi

    # Loop through datasets
    for DATASET in "${DATASETS[@]}"; do
        echo "  Dataset: $DATASET"
        LOG_FILE="$OUTPUT_DIR/${DATASET}_gpu_${ALGO}.log"
        > "$LOG_FILE" # Clear log file for new dataset run
        echo "  Logging to: $LOG_FILE"

        # Loop through batch sizes
        for B in "${BATCH_SIZES[@]}"; do
            echo "    Batch Size: $B"
            OUTPUT_FILE="$OUTPUT_DIR/q${B}_gpu_${ALGO}_${DATASET}.txt" # Note: No thread count 'p' prefix
            
            # Construct and run the command (adding --gpu flag)
            CMD="python3 run.py --algorithm $ALGO --dataset $DATASET --batch $B --gpu -o $OUTPUT_FILE"
            echo "    Executing: $CMD"
            
            # Execute and append stdout/stderr to the log file
            $CMD &>> "$LOG_FILE"
            
            echo "    Finished. Output appended to $LOG_FILE"
        done # End batch sizes loop
    done # End datasets loop
done # End algorithms loop

echo "All GPU percolation experiments finished."
