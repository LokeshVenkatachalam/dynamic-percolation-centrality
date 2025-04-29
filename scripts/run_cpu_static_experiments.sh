#!/bin/bash
set -e

# parameter lists
DATASETS=("brightkite" "email-enron" "p2p-Gnutella25" "p2p-Gnutella30" "PGPgiantcompo" "slashdot" "web-indochina-2004" "web-webbase-2001")
THREADS=(128 64 48 32 16 8 4 2 1)
BATCH_SIZES=(1 10 40 100 1000 5000 10000)

SRC_DIR="./src/CPU"
EXEC_DIR="./exec/CPU"
OUTPUT_DIR="./output/static"
mkdir -p "$EXEC_DIR" "$OUTPUT_DIR"

# compile static-percolation-update
echo "Compiling static-percolation-update..."
g++ -O3 -fopenmp -lstdc++ "$SRC_DIR/static-percolation-update.cpp" -o "$EXEC_DIR/spu"
echo "Done."

for DATASET in "${DATASETS[@]}"; do
    LOG="$OUTPUT_DIR/${DATASET}_static.log"
    > "$LOG"
    echo "Dataset: $DATASET" | tee -a "$LOG"

    for T in "${THREADS[@]}"; do
        echo "  Threads: $T" | tee -a "$LOG"
        for B in "${BATCH_SIZES[@]}"; do
            OUT="p${T}_q${B}_cpu_statperc_${DATASET}.txt"
            CMD="python3 run.py --algorithm statperc --dataset $DATASET --numthread $T --batch $B -o $OUT"
            echo "    $CMD" | tee -a "$LOG"
            $CMD &>> "$LOG"
        done
    done
done
