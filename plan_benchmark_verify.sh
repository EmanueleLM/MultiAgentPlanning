#!/bin/bash

datasets=("calendar_easy_to_hard_verify")

for data in "${datasets[@]}"; do
    echo "Running benchmark.py with $data"
    python plan_benchmark_verify.py --dataset "$data" --model_json gpt-5-mini --model_plan gpt-5-mini --num_experiments 50 --budget 5 --optimize_plan false
done