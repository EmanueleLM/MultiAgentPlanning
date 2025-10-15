#!/bin/bash

# Non-optimized plan
datasets=("calendar_scheduling")
for data in "${datasets[@]}"; do
    echo "Running plan_benchmark.py with $data"
    python plan_benchmark.py --dataset "$data" --model_json gpt-5-mini --model_plan gpt-5-mini --num_experiments 30 --budget 10 --optimize_plan false
done

# Optimized plan
datasets=("trip_planning" "depots" "logistics" "mystery_blocksworld" "blocksworld")
for data in "${datasets[@]}"; do
    echo "Running plan_benchmark.py with $data"
    python plan_benchmark.py --dataset "$data" --model_json gpt-5-mini --model_plan gpt-5-mini --num_experiments 30 --budget 10 --optimize_plan true
done
