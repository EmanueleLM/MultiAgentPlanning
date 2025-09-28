#!/bin/bash

judge="gpt-5-nano"
# datasets=("./data/natural_plan/calendar_scheduling.json" "./data/natural_plan/meeting_planning.json" "./data/natural_plan/trip_planning.json")
# results=("./results/google/calendar_scheduling/" "./results/google/meeting_planning/" "./results/google/trip_planning/")
datasets=("./data/natural_plan/calendar_scheduling.json")
results=("./results/google/calendar_scheduling/")
solver="FastDownwards"

for i in "${!datasets[@]}"; do
    data="${datasets[$i]}"
    result="${results[$i]}"
    echo "Running evaluate.py with dataset=$data and result=$result. Judge model=$judge"
    python3 evaluate.py "$data" "$result/$solver/" --model "$judge"
done