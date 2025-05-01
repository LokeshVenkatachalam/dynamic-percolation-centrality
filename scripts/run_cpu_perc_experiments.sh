#!/bin/bash

# Ensure the script stops if any command fails
set -e

# Define parameter lists
DATASETS=("brightkite" "email-enron" "p2p-Gnutella25" "p2p-Gnutella30" "PGPgiantcompo" "slashdot" "web-indochina-2004" "web-webbase-2001")
# THREADS=(1 2 4 8 16 32 48 64 128 ) #256)
# Reverse Thread count
# THREADS=(128 64 48 32 16 8 4 2 1) #256)
# BATCH_SIZES=(1 10 40 100 1000 5000 10000)
THREADS=(32 16 8 1)
BATCH_SIZES=(1 10 100 1000 10000)

ALGORITHMS=("dynperc" "statperc") # "dynperc")

# Define source and executable paths (relative to the root directory where the script is expected to be run)
SRC_DIR="./src/CPU"
EXEC_DIR="./exec/CPU"
OUTPUT_DIR="./output" # Assuming output files go here, adjust if needed

# Create directories if they don't exist
mkdir -p "$EXEC_DIR"
mkdir -p "$OUTPUT_DIR"

# Compile executables
echo "Compiling CPU executables..."
g++ -O3 -fopenmp -lstdc++ "$SRC_DIR/dynamic-percolation-update.cpp" -o "$EXEC_DIR/dpu"
g++ -O3 -fopenmp -lstdc++ "$SRC_DIR/static-percolation-update.cpp" -o "$EXEC_DIR/spu"
echo "Compilation finished."

export OMP_PLACES=cores
export OMP_PROC_BIND=close
# Loop through algorithms
for ALGO in "${ALGORITHMS[@]}"; do
    echo "Running algorithm: $ALGO"

    # Determine the correct executable and source file for the algorithm
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
        LOG_FILE="$OUTPUT_DIR/${DATASET}_cpu_${ALGO}.log"
        # Clear log file for new dataset run or keep appending? Let's clear for now.
        > "$LOG_FILE" 
        echo "  Logging to: $LOG_FILE"

        # Loop through thread counts
        for T in "${THREADS[@]}"; do
            echo "    Threads: $T"

            # Loop through batch sizes
            for B in "${BATCH_SIZES[@]}"; do
                echo "      Batch Size: $B"
                OUTPUT_FILE="p${T}_q${B}_cpu_${ALGO}_${DATASET}.txt"
                
                # Construct and run the command
                CMD="python3 run.py --algorithm $ALGO --dataset $DATASET --numthread $T --batch $B -o $OUTPUT_FILE"
                echo "      Executing: $CMD"
                
                # Execute and append stdout/stderr to the log file
                $CMD &>> "$LOG_FILE"
                
                echo "      Finished. Output appended to $LOG_FILE"
            done # End batch sizes loop
        done # End threads loop
    done # End datasets loop
done # End algorithms loop

echo "All CPU experiments finished."

