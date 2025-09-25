#!/bin/bash

# datasets=("calendar_scheduling" "meeting_planning" "trip_planning")

# for data in "${datasets[@]}"; do
#     echo "Running benchmark.py with $data"
#     python benchmark.py --dataset "$data" --model_json gpt-5-mini --model_plan gpt-5-mini --num_experiments 30 --budget 10 --optimize_plan false
# done

datasets=("calendar_easy_to_hard")

for data in "${datasets[@]}"; do
    echo "Running benchmark.py with $data"
    python benchmark.py --dataset "$data" --model_json gpt-5-mini --model_plan gpt-5-mini --num_experiments 50 --budget 10 --optimize_plan false
done