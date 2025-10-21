#!/bin/bash

judge="gpt-5-nano"

# 1. Evaluate PDDL-based approaches
# Format example:
datasets=("./data/blocksworld_scaling/blocksworld_20_actions.json"
"./data/blocksworld_scaling/blocksworld_30_actions.json"
"./data/blocksworld_scaling/blocksworld_40_actions.json"
"./data/blocksworld_scaling/blocksworld_50_actions.json"
"./data/blocksworld_scaling/blocksworld_60_actions.json")
results=("./results/blocksworld_scaling/blocksworld_scaling/FastDownwards/20_actions/FastDownwards/"
"./results/blocksworld_scaling/blocksworld_scaling/FastDownwards/30_actions/FastDownwards/"
"./results/blocksworld_scaling/blocksworld_scaling/FastDownwards/40_actions/FastDownwards/"
"./results/blocksworld_scaling/blocksworld_scaling/FastDownwards/50_actions/FastDownwards/"
"./results/blocksworld_scaling/blocksworld_scaling/FastDownwards/60_actions/FastDownwards")

for i in "${!datasets[@]}"; do
    data="${datasets[$i]}"
    result="${results[$i]}"
    echo "Running evaluate_pddl.py with dataset=$data and result=$result. Judge model=$judge"
    python3 evaluate_pddl.py "$data" "$result" --model "$judge"
done

# # 2. Evaluate Vanilla LLM approaches
# Format example:
results=("./results/blocksworld_scaling/blocksworld_scaling/vanilla_llm/gpt-5-mini.json")

for i in "${!results[@]}"; do
    result="${results[$i]}"
    echo "Running evaluate_vanilla.py with result=$result. Judge model=$judge"
    python3 evaluate_vanilla.py "$result" --model "$judge"
done