#!/bin/bash

judge="gpt-5-nano"

# Evaluate PDDL-based approaches
# Standard planning
datasets=(
"./data/planbench/depots.json"
# "./data/planbench/logistics.json"
# "./data/planbench/mystery_blocksworld.json"
)
dataset_names=(
"depots"
# "logistics"
# "mystery_blocksworld"
)
results=(
"./results/planbench/depots/FastDownwards/"
# "./results/planbench/logistics/FastDownwards/"
# "./results/planbench/mystery_blocksworld/FastDownwards/"
)
for i in "${!datasets[@]}"; do
    data="${datasets[$i]}"
    result="${results[$i]}"
    dataset_name="${dataset_names[$i]}"
    echo "Running evaluate_pddl.py with dataset=$data (name=$dataset_name) and result=$result. Judge model=$judge"
    python3 evaluate_pddl.py "$data" "$result" --model "$judge" --dataset-name "$dataset_name" --prompt-key "$dataset_name"
done

# # Evaluate vanilla LLM-based approaches
# # Standard planning
# results=(
# "./results/planbench/blocksworld/vanilla_llm/gpt-5.json"
# )
# dataset_names=(
# "blocksworld"
# )
# for i in "${!results[@]}"; do
#     result="${results[$i]}"
#     dataset_name="${dataset_names[$i]}"
#     echo "Running evaluate_vanilla.py with dataset=$result (name=$dataset_name). Judge model=$judge"
#     python3 evaluate_vanilla.py "$result" --model "$judge" --dataset-name "$dataset_name" --prompt-key "$dataset_name"
# done
