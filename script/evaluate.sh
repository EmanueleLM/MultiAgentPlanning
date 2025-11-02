#!/bin/bash

judge="gpt-5-nano"

# Evaluate vanilla LLM-based approaches
# Standard planning
results=("./results/google/calendar_scheduling/vanilla_llm/gpt-5.json"
"./results/google/meeting_planning/vanilla_llm/gpt-5.json"
"./results/google/trip_planning/vanilla_llm/gpt-5.json"
# "./results/planbench/blocksworld/vanilla_llm/gpt-5.json"
"./results/planbench/logistics/vanilla_llm/gpt-5.json"
"./results/planbench/depots/vanilla_llm/gpt-5.json"
"./results/planbench/mystery_blocksworld/vanilla_llm/gpt-5.json"
"./results/planbench/obfuscated_deceptive_logistics/vanilla_llm/gpt-5.json"
)
for i in "${!results[@]}"; do
    result="${results[$i]}"
    echo "Running evaluate_vanilla.py with dataset=$data. Judge model=$judge"
    python3 evaluate_vanilla.py "$result" --model "$judge"
done

# Evaluate PDDL-based approaches
# Standard planning
# datasets=("./data/natural_plan/calendar_scheduling.json"
# "./data/natural_plan/meeting_planning.json"
# "./data/natural_plan/trip_planning.json"
# # "./data/planbench/blocksworld.json"
# "./data/planbench/logistics.json"
# "./data/planbench/depots.json"
# "./data/planbench/mystery_blocksworld.json"
# "./data/planbench/obfuscated_deceptive_logistics.json"
# )
# results=("./results/google/calendar_scheduling/FastDownwards/"
# "./results/google/meeting_planning/FastDownwards/"
# "./results/google/trip_planning/FastDownwards/"
# # "./results/planbench/blocksworld/FastDownwards/"
# "./results/planbench/logistics/FastDownwards/"
# "./results/planbench/depots/FastDownwards/"
# "./results/planbench/mystery_blocksworld/FastDownwards/"
# "./results/planbench/obfuscated_deceptive_logistics/FastDownwards/"
# )
# for i in "${!datasets[@]}"; do
#     data="${datasets[$i]}"
#     result="${results[$i]}"
#     echo "Running evaluate_pddl.py with dataset=$data and result=$result. Judge model=$judge"
#     python3 evaluate_pddl.py "$data" "$result" --model "$judge"
# done
