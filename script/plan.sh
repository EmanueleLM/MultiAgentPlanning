#!/bin/bash

# LLMs planning
NUM_EXPERIMENTS_PER_FILE=30
MODEL=gpt-5-mini

# === PDDL based approaches ===
# Standard planning
datasets=(
# "hanoi_easy"
"hanoi_medium"
# "hanoi_hard"
)
for data in "${datasets[@]}"; do
    echo "Running plan_benchmark.py with $data"
    python plan_benchmark.py --dataset "$data" --model_json $MODEL --model_plan $MODEL --num_experiments $NUM_EXPERIMENTS_PER_FILE --budget 10 --optimize_plan false
done

# === LLM based approaches ===
# Standard planning
for data in "${datasets[@]}"; do
    echo "Running baseline.py with $data"   
    python baseline.py --dataset "$data" --model $MODEL --num_experiments $NUM_EXPERIMENTS_PER_FILE
done