#!/usr/bin/env bash
set -euo pipefail

judge="gpt-5-mini"

MODELS=(
  "gpt-5-mini"
  "gpt-5.4"
  # "gemini-2.5-flash"
  # "gemini-3-flash"
  # "gpt-4o"
)

# Format:
#   "dataset_name|data_path|pddl_result_template|vanilla_result_template"
# Templates may contain @model@ and @run@.
CASES=(
  "calendar_scheduling|./data/natural_plan/calendar_scheduling.json|./results/@model@/@run@/google/calendar_scheduling/FastDownwards/|./results/@model@/@run@/google/calendar_scheduling/vanilla_llm/@model@.json"
  "meeting_planning|./data/natural_plan/meeting_planning.json|./results/@model@/@run@/google/meeting_planning/FastDownwards/|./results/@model@/@run@/google/meeting_planning/vanilla_llm/@model@.json"
  "trip_planning|./data/natural_plan/trip_planning.json|./results/@model@/@run@/google/trip_planning/FastDownwards/|./results/@model@/@run@/google/trip_planning/vanilla_llm/@model@.json"
  "depots|./data/planbench/depots.json|./results/@model@/@run@/planbench/depots/FastDownwards/|./results/@model@/@run@/planbench/depots/vanilla_llm/@model@.json"
  "logistics|./data/planbench/logistics.json|./results/@model@/@run@/planbench/logistics/FastDownwards/|./results/@model@/@run@/planbench/logistics/vanilla_llm/@model@.json"
  "mystery_blocksworld|./data/planbench/mystery_blocksworld.json|./results/@model@/@run@/planbench/mystery_blocksworld/FastDownwards/|./results/@model@/@run@/planbench/mystery_blocksworld/vanilla_llm/@model@.json"
  "obfuscated_deceptive_logistics|./data/planbench/obfuscated_deceptive_logistics.json|./results/@model@/@run@/planbench/obfuscated_deceptive_logistics/FastDownwards/|./results/@model@/@run@/planbench/obfuscated_deceptive_logistics/vanilla_llm/@model@.json"
)

subst_path() {
  local template="$1"
  local model="$2"
  local run="$3"

  template="${template//@model@/$model}"
  template="${template//@run@/$run}"
  printf '%s' "$template"
}

run_pddl_eval() {
  local run="$1"
  local model="$2"
  local dataset_name="$3"
  local data_path="$4"
  local result_template="$5"

  local result_path
  result_path="$(subst_path "$result_template" "$model" "$run")"

  echo "Running evaluate_pddl.py with dataset=$data_path (name=$dataset_name) and result=$result_path. Judge model=$judge"
  python3 evaluate_pddl.py \
    "$data_path" \
    "$result_path" \
    --model "$judge" \
    --dataset-name "$dataset_name" \
    --prompt-key "$dataset_name"
}

run_vanilla_eval() {
  local run="$1"
  local model="$2"
  local dataset_name="$3"
  local result_template="$4"

  local result_path
  result_path="$(subst_path "$result_template" "$model" "$run")"

  echo "Running evaluate_vanilla.py with dataset=$result_path (name=$dataset_name). Judge model=$judge"
  python3 evaluate_vanilla.py \
    "$result_path" \
    --model "$judge" \
    --dataset-name "$dataset_name" \
    --prompt-key "$dataset_name"
}

main() {
  local run model case dataset_name data_path pddl_tpl vanilla_tpl
  local IFS='|'

  # PDDL-based approaches
  for run in run1; do
    for model in "${MODELS[@]}"; do
      for case in "${CASES[@]}"; do
        read -r dataset_name data_path pddl_tpl vanilla_tpl <<< "$case"
        run_pddl_eval "$run" "$model" "$dataset_name" "$data_path" "$pddl_tpl"
      done
    done
  done

  # Vanilla LLM-based approaches
  for run in run1; do
    for model in "${MODELS[@]}"; do
      for case in "${CASES[@]}"; do
        read -r dataset_name _data_path _pddl_tpl vanilla_tpl <<< "$case"
        run_vanilla_eval "$run" "$model" "$dataset_name" "$vanilla_tpl"
      done
    done
  done
}

main "$@"