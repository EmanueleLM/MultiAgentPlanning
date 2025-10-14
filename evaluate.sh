#!/bin/bash

judge="gpt-5-nano"
# datasets=("./data/natural_plan/calendar_scheduling.json" "./data/natural_plan/meeting_planning.json" "./data/natural_plan/trip_planning.json")
# results=("./results/google/calendar_scheduling/" "./results/google/meeting_planning/" "./results/google/trip_planning/")
datasets=("./data/blocksworld/blocks_world_dataset.json")
results=("./results/blocksworld/FastDownwards/non_optimized/")

for i in "${!datasets[@]}"; do
    data="${datasets[$i]}"
    result="${results[$i]}"
    echo "Running evaluate.py with dataset=$data and result=$result. Judge model=$judge"
    python3 evaluate.py "$data" "$result" --model "$judge"
done