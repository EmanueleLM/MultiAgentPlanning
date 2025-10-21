#!/bin/bash

datasets=("blocksworld_scaling")
for data in "${datasets[@]}"; do
    echo "Running plan_benchmark.py with $data"
    python plan_benchmark.py --dataset "$data" --model_json gpt-5-mini --model_plan gpt-5-mini --num_experiments 150 --budget 10 --optimize_plan true
done
