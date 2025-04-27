#!/bin/bash

# Define paths
DATASET_DIR="./datasets"
BASE_OUTPUT_DIR="./queries/percolation-update-queries"
QUERY_GENERATOR_EXEC="./exec/query-gen/percolation_query_gen"
QUERY_GENERATOR_SRC="/home/lokesh/github/dynamic-percolation-centrality/src/query-generator/percolation-update-queryGen-2.cpp"

# Ensure the query generator executable exists, compile if not
if [ ! -f "$QUERY_GENERATOR_EXEC" ]; then
    echo "Query generator executable not found. Compiling..."
    mkdir -p "$(dirname "$QUERY_GENERATOR_EXEC")"
    if g++ "$QUERY_GENERATOR_SRC" -o "$QUERY_GENERATOR_EXEC" -std=c++11 -O2; then
        echo "Compilation successful."
    else
        echo "Compilation failed. Exiting."
        exit 1
    fi
fi

# Query counts
QUERY_COUNTS=(1000 5000 10000)

# Check if dataset directory exists
if [ ! -d "$DATASET_DIR" ]; then
    echo "Dataset directory '$DATASET_DIR' not found. Exiting."
    exit 1
fi

# Generate queries for each count and dataset
for Q_COUNT in "${QUERY_COUNTS[@]}"; do
    OUTPUT_DIR="$BASE_OUTPUT_DIR/queries_$Q_COUNT"
    mkdir -p "$OUTPUT_DIR"
    echo "Generating queries for $Q_COUNT queries into $OUTPUT_DIR"

    for DATASET_PATH in "$DATASET_DIR"/*.in; do
        if [ -f "$DATASET_PATH" ]; then
            DATASET_NAME=$(basename "$DATASET_PATH" .in)
            OUTPUT_FILE="$OUTPUT_DIR/${DATASET_NAME}.txt"
            echo "  Generating for dataset: $DATASET_NAME"
            "$QUERY_GENERATOR_EXEC" "$DATASET_PATH" "$Q_COUNT" > "$OUTPUT_FILE"
            if [ $? -ne 0 ]; then
                echo "  Error generating queries for $DATASET_NAME with $Q_COUNT queries."
            fi
        fi
    done
done

echo "Query generation complete."

