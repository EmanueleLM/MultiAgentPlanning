#!/bin/bash

# Judge model
judge="gpt-5-nano"

# LLM models to evaluate
models=(
"gpt-5-mini"
# "gpt-5"
)

# Dataset names
dataset_names=(
"calendar_scheduling"
"meeting_planning"
"trip_planning"
"depots"
"logistics"
"mystery_blocksworld"
"obfuscated_deceptive_logistics"
"blocksworld_easy"
"blocksworld_medium"
"blocksworld_hard"
"hanoi_easy"
"hanoi_medium"
"hanoi_hard"
"hanoi_extreme"
)

# Datasets
datasets=(
"./data/natural_plan/calendar_scheduling.json"
"./data/natural_plan/meeting_planning.json"
"./data/natural_plan/trip_planning.json"
"./data/planbench/depots.json"
"./data/planbench/logistics.json"
"./data/planbench/mystery_blocksworld.json"
"./data/planbench/obfuscated_deceptive_logistics.json"
"./data/blocksworld/blocksworld_easy.json"
"./data/blocksworld/blocksworld_medium.json"
"./data/blocksworld/blocksworld_hard.json"
"./data/hanoi/hanoi_easy.json"
"./data/hanoi/hanoi_medium.json"
"./data/hanoi/hanoi_hard.json"
"./data/hanoi/hanoi_extreme.json"
)

for model_idx in "${!models[@]}"; do
    model="${models[$model_idx]}"
    echo "Evaluating results for model: $model"

    # Build result paths after model is bound so interpolation happens correctly
    results_pddl=(
        "./results/google/calendar_scheduling/FastDownwards/"
        "./results/google/meeting_planning/FastDownwards/"
        "./results/google/trip_planning/FastDownwards/"
        "./results/planbench/depots/FastDownwards/"
        "./results/planbench/logistics/FastDownwards/"
        "./results/planbench/mystery_blocksworld/FastDownwards/"
        "./results/planbench/obfuscated_deceptive_logistics/FastDownwards/"
        "./results/blocksworld/blocksworld_easy/blocksworld_easy/FastDownwards/"
        "./results/blocksworld/blocksworld_medium/blocksworld_medium/FastDownwards/"
        "./results/blocksworld/blocksworld_hard/blocksworld_hard/FastDownwards/"
        "./results/hanoi/hanoi_easy/hanoi_easy/FastDownwards/"
        "./results/hanoi/hanoi_medium/hanoi_medium/FastDownwards/"
        "./results/hanoi/hanoi_hard/hanoi_hard/FastDownwards/"
        "./results/hanoi/hanoi_extreme/hanoi_extreme/FastDownwards/"
    )

    results_vanilla=(
        "./results/google/calendar_scheduling/vanilla_llm/${model}.json"
        "./results/google/meeting_planning/vanilla_llm/${model}.json"
        "./results/google/trip_planning/vanilla_llm/${model}.json"
        "./results/planbench/depots/vanilla_llm/${model}.json"
        "./results/planbench/logistics/vanilla_llm/${model}.json"
        "./results/planbench/mystery_blocksworld/vanilla_llm/${model}.json"
        "./results/planbench/obfuscated_deceptive_logistics/vanilla_llm/${model}.json"
        "./results/blocksworld/blocksworld_easy/blocksworld_easy/vanilla_llm/${model}.json"
        "./results/blocksworld/blocksworld_medium/blocksworld_medium/vanilla_llm/${model}.json"
        "./results/blocksworld/blocksworld_hard/blocksworld_hard/vanilla_llm/${model}.json"
        "./results/hanoi/hanoi_easy/hanoi_easy/vanilla_llm/${model}.json"
        "./results/hanoi/hanoi_medium/hanoi_medium/vanilla_llm/${model}.json"
        "./results/hanoi/hanoi_hard/hanoi_hard/vanilla_llm/${model}.json"
        "./results/hanoi/hanoi_extreme/hanoi_extreme/vanilla_llm/${model}.json"
    )

    # Evaluate PDDL-based approaches
    for i in "${!datasets[@]}"; do
        data="${datasets[$i]}"
        result="${results_pddl[$i]}"
        dataset_name="${dataset_names[$i]}"
        echo "Running evaluate_pddl.py with dataset=$data (name=$dataset_name) and result=$result. Judge model=$judge"
        python3 evaluate_pddl.py "$data" "$result" --model "$judge" --dataset-name "$dataset_name" --prompt-key "$dataset_name"
    done

    # Evaluate vanilla LLM-based approaches
    for i in "${!results_vanilla[@]}"; do
        result="${results_vanilla[$i]}"
        dataset_name="${dataset_names[$i]}"
        echo "Running evaluate_vanilla.py with dataset=$result (name=$dataset_name). Judge model=$judge"
        python3 evaluate_vanilla.py "$result" --model "$judge" --dataset-name "$dataset_name" --prompt-key "$dataset_name"
    done

done
