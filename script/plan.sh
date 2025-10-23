#!/bin/bash

# LLMs planning
NUM_EXPERIMENTS_PER_FILE=20

# Blocksworld predict final state
datasets=("blocksworld_multi_agent_1_agents" "blocksworld_multi_agent_2_agents" "blocksworld_multi_agent_3_agents" "blocksworld_multi_agent_4_agents")
for data in "${datasets[@]}"; do
    echo "Running plan_benchmark.py with $data"
    python plan_benchmark.py --dataset "$data" --model_json gpt-5-mini --model_plan gpt-5-mini --num_experiments $NUM_EXPERIMENTS_PER_FILE --budget 10 --optimize_plan true
done

# Hanoi planning
datasets=("hanoi_multi_agent_1_agent" "hanoi_multi_agent_2_agent" "hanoi_multi_agent_3_agent" "hanoi_multi_agent_4_agent")
for data in "${datasets[@]}"; do
    echo "Running plan_benchmark.py with $data"
    python plan_benchmark.py --dataset "$data" --model_json gpt-5-mini --model_plan gpt-5-mini --num_experiments $NUM_EXPERIMENTS_PER_FILE --budget 10 --optimize_plan true
done

# Vanilla LLMs (baseline)
NUM_EXPERIMENTS_PER_FILE=20

# Blocksworld predict final state
datasets=("blocksworld_multi_agent_1_agents" "blocksworld_multi_agent_2_agents" "blocksworld_multi_agent_3_agents" "blocksworld_multi_agent_4_agents")
for data in "${datasets[@]}"; do
    echo "Running baseline.py with $data"
    python baseline.py --dataset "$data" --model gpt-5-mini --num_experiments $NUM_EXPERIMENTS_PER_FILE
done

# Hanoi planning
datasets=("hanoi_multi_agent_1_agent" "hanoi_multi_agent_2_agent" "hanoi_multi_agent_3_agent" "hanoi_multi_agent_4_agent")
for data in "${datasets[@]}"; do
    echo "Running baseline.py with $data"   
    python baseline.py --dataset "$data" --model gpt-5-mini --num_experiments $NUM_EXPERIMENTS_PER_FILE
done