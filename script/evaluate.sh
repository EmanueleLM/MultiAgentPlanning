#!/bin/bash

judge="gpt-5-nano"
model="gpt-5-mini"

# Evaluate PDDL-based approaches
# Standard planning
dataset_names=(
"calendar_scheduling"
"meeting_planning"
"trip_planning"
"depots"
"logistics"
"mystery_blocksworld"
"obfuscated_deceptive_logistics"
)
datasets=(
"./data/natural_plan/calendar_scheduling.json"
"./data/natural_plan/meeting_planning.json"
"./data/natural_plan/trip_planning.json"
"./data/planbench/depots.json"
"./data/planbench/logistics.json"
"./data/planbench/mystery_blocksworld.json"
"./data/planbench/obfuscated_deceptive_logistics.json"
)
results=(
"./results/${model}/consolidated_results/google/calendar_scheduling/FastDownwards/"
"./results/${model}/consolidated_results/google/meeting_planning/FastDownwards/"
"./results/${model}/consolidated_results/google/trip_planning/FastDownwards/"
"./results/${model}/consolidated_results/planbench/depots/FastDownwards/"
"./results/${model}/consolidated_results/planbench/logistics/FastDownwards/"
"./results/${model}/consolidated_results/planbench/mystery_blocksworld/FastDownwards/"
"./results/${model}/consolidated_results/planbench/obfuscated_deceptive_logistics/FastDownwards/"
)
for i in "${!datasets[@]}"; do
    data="${datasets[$i]}"
    result="${results[$i]}"
    dataset_name="${dataset_names[$i]}"
    echo "Running evaluate_pddl.py with dataset=$data (name=$dataset_name) and result=$result. Judge model=$judge"
    python3 evaluate_pddl.py "$data" "$result" --model "$judge" --dataset-name "$dataset_name" --prompt-key "$dataset_name"
done

# Evaluate vanilla LLM-based approaches
# Standard planning
dataset_names=(
"calendar_scheduling"
"meeting_planning"
"trip_planning"
"depots"
"logistics"
"mystery_blocksworld"
"obfuscated_deceptive_logistics"
)
results=(
"./results/${model}/consolidated_results/google/calendar_scheduling/vanilla_llm/gpt-5-mini.json"
"./results/${model}/consolidated_results/google/meeting_planning/vanilla_llm/gpt-5-mini.json"
"./results/${model}/consolidated_results/google/trip_planning/vanilla_llm/gpt-5-mini.json"
"./results/${model}/consolidated_results/planbench/depots/vanilla_llm/gpt-5-mini.json"
"./results/${model}/consolidated_results/planbench/logistics/vanilla_llm/gpt-5-mini.json"
"./results/${model}/consolidated_results/planbench/mystery_blocksworld/vanilla_llm/gpt-5-mini.json"
"./results/${model}/consolidated_results/planbench/obfuscated_deceptive_logistics/vanilla_llm/gpt-5-mini.json"
)
for i in "${!results[@]}"; do
    result="${results[$i]}"
    dataset_name="${dataset_names[$i]}"
    echo "Running evaluate_vanilla.py with dataset=$result (name=$dataset_name). Judge model=$judge"
    python3 evaluate_vanilla.py "$result" --model "$judge" --dataset-name "$dataset_name" --prompt-key "$dataset_name"
done
