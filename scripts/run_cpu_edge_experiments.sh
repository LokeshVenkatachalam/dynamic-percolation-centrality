#!/bin/bash

# Ensure the script stops if any command fails
set -e

# Define parameter lists
DATASETS=("brightkite" "email-enron" "p2p-Gnutella25" "p2p-Gnutella30" "PGPgiantcompo" "slashdot" "web-indochina-2004" "web-webbase-2001")
THREADS=(1 2 4 8 16 32 48 64 128) #256)
BATCH_SIZES=(1 10 40 100 1000) # 5000 10000)
ALGORITHMS=("dynedge" "statedge") # Edge update algorithms

# Define source and executable paths
SRC_DIR="./src/CPU"
EXEC_DIR="./exec/CPU"
OUTPUT_DIR="./output"

# Create directories if they don't exist
mkdir -p "$EXEC_DIR"
mkdir -p "$OUTPUT_DIR"

# Compile CPU executables for edge updates
echo "Compiling CPU edge update executables..."
g++ -O3 -fopenmp -lstdc++ "$SRC_DIR/dynamic-edge-update.cpp" -o "$EXEC_DIR/deu"
g++ -O3 -fopenmp -lstdc++ "$SRC_DIR/static-edge-update.cpp" -o "$EXEC_DIR/seu"
echo "Compilation finished."

# Loop through algorithms
for ALGO in "${ALGORITHMS[@]}"; do
    echo "Running algorithm: $ALGO on CPU"

    # Determine the correct executable suffix
    EXEC_SUFFIX=""
    if [ "$ALGO" == "dynedge" ]; then
        EXEC_SUFFIX="deu"
    elif [ "$ALGO" == "statedge" ]; then
        EXEC_SUFFIX="seu"
    else
        echo "Unknown algorithm: $ALGO. Skipping."
        continue
    fi

    # Loop through datasets
    for DATASET in "${DATASETS[@]}"; do
        echo "  Dataset: $DATASET"
        LOG_FILE="$OUTPUT_DIR/${DATASET}_cpu_${ALGO}.log"
        > "$LOG_FILE" # Clear log file for new dataset run
        echo "  Logging to: $LOG_FILE"

        # Loop through thread counts
        for T in "${THREADS[@]}"; do
            echo "    Threads: $T"

            # Loop through batch sizes
            for B in "${BATCH_SIZES[@]}"; do
                echo "      Batch Size: $B"
                OUTPUT_FILE="$OUTPUT_DIR/p${T}_q${B}_cpu_${ALGO}_${DATASET}.txt"
                
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

echo "All CPU edge update experiments finished."
