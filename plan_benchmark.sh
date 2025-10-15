#!/bin/bash

# datasets=("depots" "logistics" "mystery_blocksworld", "obfuscated_deceptive_logistics")
datasets=("mystery_blocksworld")

for data in "${datasets[@]}"; do
    echo "Running plan_benchmark.py with $data"
    python plan_benchmark.py --dataset "$data" --model_json gpt-5-mini --model_plan gpt-5-mini --num_experiments 30 --budget 5 --optimize_plan true
done

# datasets=("blocksworld")

# for data in "${datasets[@]}"; do
#     echo "Running plan_benchmark.py with $data"
#     python plan_benchmark.py --dataset "$data" --model_json gpt-5-mini --model_plan gpt-5-mini --num_experiments 30 --budget 10 --optimize_plan true
# done