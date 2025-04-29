#!/bin/bash
set -e

# parameter lists
DATASETS=("brightkite" "email-enron" "p2p-Gnutella25" "p2p-Gnutella30" "PGPgiantcompo" "slashdot" "web-indochina-2004" "web-webbase-2001")
BATCH_SIZES=(1 10 40 100 1000 5000 10000)

SRC_DIR="./src/GPU"
EXEC_DIR="./exec/GPU"
OUTPUT_DIR="./output/static_gpu"
mkdir -p "$EXEC_DIR" "$OUTPUT_DIR"

# compile GPU static-percolation (CUDA version)
echo "Compiling GPU static-percolation-update..."
nvcc -O3 "$SRC_DIR/static-percolation-update.cu" -o "$EXEC_DIR/spu_gpu"
echo "Compilation done."

for DATASET in "${DATASETS[@]}"; do
    LOG="$OUTPUT_DIR/${DATASET}_static_gpu.log"
    > "$LOG"
    echo "Dataset: $DATASET" | tee -a "$LOG"

    for B in "${BATCH_SIZES[@]}"; do
        OUT="gpu_q${B}_static_${DATASET}.txt"
        CMD="python3 run.py --algorithm statperc --dataset $DATASET --device gpu --batch $B -o $OUT"
        echo "    $CMD" | tee -a "$LOG"
        $CMD &>> "$LOG"
    done
done

echo "All GPU static experiments finished."
