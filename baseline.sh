#!/bin/bash

# Vanilla LLMs (just prompting)
# datasets=("calendar_scheduling" "meeting_planning" "trip_planning" "calendar_easy_to_hard")
datasets=("calendar_easy_to_hard_shifted")

for data in "${datasets[@]}"; do
    echo "Running benchmark.py with $data"
    python baseline.py --dataset "$data" --model gpt-5-mini --num_experiments 50
done