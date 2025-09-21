#!/bin/bash

# datasets=("calendar_scheduling" "meeting_planning" "trip_planning" "calendar_easy_to_hard")
datasets=("blocksworld")

for data in "${datasets[@]}"; do
    echo "Running benchmark.py with $data"
    python benchmark.py --dataset "$data" --model_json gpt-5-mini --model_plan gpt-5-mini --num_experiments 30 --budget 3 --optimize_plan true
done