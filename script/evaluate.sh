#!/bin/bash

judge="gpt-5-nano"

# 1. Evaluate PDDL-based approaches
# Blocksworld scaling
datasets=("./data/blocksworld_scaling/blocksworld_40_actions.json"
"./data/blocksworld_scaling/blocksworld_50_actions.json"
"./data/blocksworld_scaling/blocksworld_60_actions.json")
results=("./results/blocksworld_scaling/blocksworld_scaling/FastDownwards/40_actions/FastDownwards/"
"./results/blocksworld_scaling/blocksworld_scaling/FastDownwards/50_actions/FastDownwards/"
"./results/blocksworld_scaling/blocksworld_scaling/FastDownwards/60_actions/FastDownwards/"
)
for i in "${!datasets[@]}"; do
    data="${datasets[$i]}"
    result="${results[$i]}"
    echo "Running evaluate_pddl.py with dataset=$data and result=$result. Judge model=$judge"
    python3 evaluate_pddl.py "$data" "$result" --model "$judge"
done
