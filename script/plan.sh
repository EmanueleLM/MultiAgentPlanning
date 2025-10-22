#!/bin/bash

# LLMs planning
# NUM_EXPERIMENTS_PER_FILE=20

# # Blocksworld predict final state
# datasets=("blocksworld_10_actions_scaling" "blocksworld_20_actions_scaling" "blocksworld_30_actions_scaling" "blocksworld_40_actions_scaling" "blocksworld_50_actions_scaling")
# for data in "${datasets[@]}"; do
#     echo "Running plan_benchmark.py with $data"
#     python plan_benchmark.py --dataset "$data" --model_json gpt-5-mini --model_plan gpt-5-mini --num_experiments $NUM_EXPERIMENTS_PER_FILE --budget 10 --optimize_plan true
# done

# # Hanoi planning
# datasets=("hanoi_4_disks" "hanoi_5_disks" "hanoi_6_disks" "hanoi_7_disks" "hanoi_8_disks")
# for data in "${datasets[@]}"; do
#     echo "Running plan_benchmark.py with $data"
#     python plan_benchmark.py --dataset "$data" --model_json gpt-5-mini --model_plan gpt-5-mini --num_experiments $NUM_EXPERIMENTS_PER_FILE --budget 10 --optimize_plan true
# done

# Vanilla LLMs (baseline)
NUM_EXPERIMENTS_PER_FILE=20

# Blocksworld predict final state
datasets=("blocksworld_10_actions_scaling" "blocksworld_20_actions_scaling" "blocksworld_30_actions_scaling" "blocksworld_40_actions_scaling" "blocksworld_50_actions_scaling")
for data in "${datasets[@]}"; do
    echo "Running baseline.py with $data"
    python baseline.py --dataset "$data" --model gpt-5-mini --num_experiments $NUM_EXPERIMENTS_PER_FILE
done

# Hanoi planning
datasets=("hanoi_4_disks" "hanoi_5_disks" "hanoi_6_disks" "hanoi_7_disks" "hanoi_8_disks")
for data in "${datasets[@]}"; do
    echo "Running baseline.py with $data"   
    python baseline.py --dataset "$data" --model gpt-5-mini --num_experiments $NUM_EXPERIMENTS_PER_FILE
done