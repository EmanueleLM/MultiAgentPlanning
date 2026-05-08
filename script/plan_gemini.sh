#!/bin/bash

# LLMs planning
NUM_EXPERIMENTS_PER_FILE=50
BUDGET=5
BASE_AGENT=AgentJackOfAllTrades

MODELS=(
    "gemini-2.5-flash"
    # "gemini-3-flash"
)

# Dataset names
datasets=(
"calendar_scheduling"
"meeting_planning"
"trip_planning"
"depots"
"logistics"
"mystery_blocksworld"
"obfuscated_deceptive_logistics"
# "blocksworld_easy"
# "blocksworld_medium"
# "blocksworld_hard"
# "hanoi_easy"
# "hanoi_medium"
# "hanoi_hard"
# "hanoi_extreme"
# "floortile"
# "childsnack"
# "sokobanlevels"
)


# === PDDL based approaches ===
# Standard planning
for MODEL in "${MODELS[@]}"; do
    for data in "${datasets[@]}"; do
        echo "Running plan_benchmark.py with $data"
        python plan_benchmark.py --dataset "$data" --model_json $MODEL --model_plan $MODEL --num_experiments $NUM_EXPERIMENTS_PER_FILE --budget $BUDGET --base_agent $BASE_AGENT --optimize_plan false
    done
done

# === LLM based approaches ===
# Standard planning
for MODEL in "${MODELS[@]}"; do
    for data in "${datasets[@]}"; do
        echo "Running baseline.py with $data"   
        python baseline.py --dataset "$data" --model $MODEL --num_experiments $NUM_EXPERIMENTS_PER_FILE
    done
done