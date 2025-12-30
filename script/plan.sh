#!/bin/bash

# LLMs planning
NUM_EXPERIMENTS_PER_FILE=30
MODEL=gemini-2.5-flash
BUDGET=10

# === PDDL based approaches ===
# Standard planning
datasets=(
# "calendar_scheduling"
# "meeting_planning"
"trip_planning"
# "depots"
# "logistics"
# "mystery_blocksworld"
# "obfuscated_deceptive_logistics"
"blocksworld_easy"
"blocksworld_medium"
"blocksworld_hard"
"hanoi_easy"
"hanoi_medium"
"hanoi_hard"
"hanoi_extreme"
# "childsnack"
# "floortile"
)
for data in "${datasets[@]}"; do
    echo "Running plan_benchmark.py with $data"
    python plan_benchmark.py --dataset "$data" --model_json $MODEL --model_plan $MODEL --num_experiments $NUM_EXPERIMENTS_PER_FILE --budget $BUDGET --optimize_plan false
done

# # === LLM based approaches ===
# # Standard planning
# for data in "${datasets[@]}"; do
#     echo "Running baseline.py with $data"   
#     python baseline.py --dataset "$data" --model $MODEL --num_experiments $NUM_EXPERIMENTS_PER_FILE
# done