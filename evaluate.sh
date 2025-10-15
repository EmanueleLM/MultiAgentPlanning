#!/bin/bash

judge="gpt-5-nano"

# 1. Evaluate PDDL-based approaches
# Format example:
# datasets=("./data/natural_plan/calendar_scheduling.json" "./data/natural_plan/trip_planning.json" "./data/planbench/depots.json" "./data/planbench/logistics.json" "./data/planbench/mystery_blocksworld.json")
# results=("./results/google/calendar_scheduling/FastDownwards/" "./results/google/trip_planning/FastDownwards/" "./results/planbench/depots/FastDownwards/" "./results/planbench/logistics/FastDownwards/" "./results/planbench/mystery_blocksworld/FastDownwards/")
datasets=("./data/natural_plan/calendar_scheduling.json")
results=("./results/google/calendar_scheduling/FastDownwards/")

for i in "${!datasets[@]}"; do
    data="${datasets[$i]}"
    result="${results[$i]}"
    echo "Running evaluate_pddl.py with dataset=$data and result=$result. Judge model=$judge"
    python3 evaluate_pddl.py "$data" "$result" --model "$judge"
done

# 2. Evaluate Vanilla LLM approaches
# Format example:
# results=("./data/natural_plan/calendar_scheduling.json" "./data/natural_plan/meeting_planning.json" "./data/natural_plan/trip_planning.json")

# results=("./results/planbench/logistics/vanilla_llm/gpt-5-mini.json" "./results/planbench/mystery_blocksworld/vanilla_llm/gpt-5-mini.json" "./results/planbench/obfuscated_deceptive_logistics/vanilla_llm/gpt-5-mini.json" "./results/google/meeting_planning/vanilla_llm/gpt-5-mini.json" "./results/google/trip_planning/vanilla_llm/gpt-5-mini.json" "./results/blocksworld/vanilla_llm/gpt-5-mini.json")
# results=("./results/planbench/depots/vanilla_llm/gpt-5-mini.json" "./results/google/calendar_scheduling/vanilla_llm/gpt-5-mini.json" "./results/blocksworld/blocksworld/vanilla_llm/gpt-5-mini.json")
# for i in "${!results[@]}"; do
#     result="${results[$i]}"
#     echo "Running evaluate_vanilla.py with result=$result. Judge model=$judge"
#     python3 evaluate_vanilla.py "$result" --model "$judge"
# done