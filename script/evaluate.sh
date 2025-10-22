#!/bin/bash

judge="gpt-5-nano"

# 1. Evaluate PDDL-based approaches
# Blocksworld scaling
datasets=("./data/blocksworld_scaling/blocksworld_10_actions_scaling.json"
"./data/blocksworld_scaling/blocksworld_20_actions_scaling.json"
"./data/blocksworld_scaling/blocksworld_30_actions_scaling.json"
"./data/blocksworld_scaling/blocksworld_40_actions_scaling.json"
"./data/blocksworld_scaling/blocksworld_50_actions_scaling.json")
results=("./results/blocksworld_scaling/blocksworld_10_actions_scaling/blocksworld_10_actions_scaling/FastDownwards/"
"./results/blocksworld_scaling/blocksworld_20_actions_scaling/blocksworld_20_actions_scaling/FastDownwards/"
"./results/blocksworld_scaling/blocksworld_30_actions_scaling/blocksworld_30_actions_scaling/FastDownwards/"
"./results/blocksworld_scaling/blocksworld_40_actions_scaling/blocksworld_40_actions_scaling/FastDownwards/"
"./results/blocksworld_scaling/blocksworld_50_actions_scaling/blocksworld_50_actions_scaling/FastDownwards/")

for i in "${!datasets[@]}"; do
    data="${datasets[$i]}"
    result="${results[$i]}"
    echo "Running evaluate_pddl.py with dataset=$data and result=$result. Judge model=$judge"
    python3 evaluate_pddl.py "$data" "$result" --model "$judge"
done

# Hanoi scaling
datasets=("./data/hanoi_scaling/hanoi_4_disks.json"
"./data/hanoi_scaling/hanoi_5_disks.json"
"./data/hanoi_scaling/hanoi_6_disks.json"
"./data/hanoi_scaling/hanoi_7_disks.json"
"./data/hanoi_scaling/hanoi_8_disks.json")
results=("./results/hanoi_scaling/hanoi_4_disks/hanoi_4_disks/FastDownwards/"
"./results/hanoi_scaling/hanoi_5_disks/hanoi_5_disks/FastDownwards/"
"./results/hanoi_scaling/hanoi_6_disks/hanoi_6_disks/FastDownwards/"
"./results/hanoi_scaling/hanoi_7_disks/hanoi_7_disks/FastDownwards/"
"./results/hanoi_scaling/hanoi_8_disks/hanoi_8_disks/FastDownwards/")

for i in "${!datasets[@]}"; do
    data="${datasets[$i]}"
    result="${results[$i]}"
    echo "Running evaluate_pddl.py with dataset=$data and result=$result. Judge model=$judge"
    python3 evaluate_pddl.py "$data" "$result" --model "$judge"
done

# # 2. Evaluate Vanilla LLM approaches
# Blocksworld scaling
results=("./results/blocksworld_scaling/blocksworld_10_actions_scaling/blocksworld_10_actions_scaling/vanilla_llm/gpt-5-mini.json"
"./results/blocksworld_scaling/blocksworld_20_actions_scaling/blocksworld_20_actions_scaling/vanilla_llm/gpt-5-mini.json"
"./results/blocksworld_scaling/blocksworld_30_actions_scaling/blocksworld_30_actions_scaling/vanilla_llm/gpt-5-mini.json"
"./results/blocksworld_scaling/blocksworld_40_actions_scaling/blocksworld_40_actions_scaling/vanilla_llm/gpt-5-mini.json"
"./results/blocksworld_scaling/blocksworld_50_actions_scaling/blocksworld_50_actions_scaling/vanilla_llm/gpt-5-mini.json")

for i in "${!results[@]}"; do
    result="${results[$i]}"
    echo "Running evaluate_vanilla.py with result=$result. Judge model=$judge"
    python3 evaluate_vanilla.py "$result" --model "$judge"
done

# Hanoi scaling
results=("./results/hanoi_scaling/hanoi_4_disks/hanoi_4_disks/vanilla_llm/gpt-5-mini.json"
"./results/hanoi_scaling/hanoi_5_disks/hanoi_5_disks/vanilla_llm/gpt-5-mini.json"
"./results/hanoi_scaling/hanoi_6_disks/hanoi_6_disks/vanilla_llm/gpt-5-mini.json"
"./results/hanoi_scaling/hanoi_7_disks/hanoi_7_disks/vanilla_llm/gpt-5-mini.json"
"./results/hanoi_scaling/hanoi_8_disks/hanoi_8_disks/vanilla_llm/gpt-5-mini.json")

for i in "${!results[@]}"; do
    result="${results[$i]}"
    echo "Running evaluate_vanilla.py with result=$result. Judge model=$judge"
    python3 evaluate_vanilla.py "$result" --model "$judge"
done
