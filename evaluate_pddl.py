"""Evaluate natural-language plan outputs against golden plans using an LLM judge."""

from __future__ import annotations

import argparse
import json
import logging
import os
import os
from dataclasses import dataclass
from pathlib import Path
from typing import Callable, Optional

from src.llm_plan.llm import ChatGPT, Gemini, LLM


LLM_FACTORIES: dict[str, Callable[[], LLM]] = {
    "gpt-4o": lambda: ChatGPT("gpt-4o"),
    "gpt-5-mini": lambda: ChatGPT("gpt-5-mini"),
    "gpt-5-nano": lambda: ChatGPT("gpt-5-nano"),
    "gemini-2.5-flash": lambda: Gemini("gemini-2.5-flash"),
    "gemini-2.5-pro": lambda: Gemini("gemini-2.5-pro"),
}

def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Evaluate natural plans against golden plans using an LLM judge.\nExample usage: python3 evaluate.py ./data/miscellanea/calendar_easy_to_hard.json ./results/calendar_easy_to_hard/calendar_easy_to_hard/FastDownwards/ --model gpt-5-nano"
    )
    parser.add_argument(
        "data_file",
        type=Path,
        help="Path to the dataset JSON (e.g., ./data/<dataset-name>/data.json).",
    )
    parser.add_argument(
        "experiments_root",
        type=Path,
        help="Root folder containing experiment outputs (e.g., ./results/<dataset-name>/FastDownwards/).",
    )
    parser.add_argument(
        "--model",
        default="gpt-5-nano",
        choices=LLM_FACTORIES.keys(),
        help="LLM used for semantic comparison (default: gpt-4o).",
    )
    parser.add_argument(
        "--verbose",
        action="store_true",
        help="Log per-example evaluation details.",
    )
    return parser.parse_args()

@dataclass
class ExampleResult:
    key: str
    golden: str
    natural_plan: Optional[str]
    correct: bool
    reason: str
    plan_path: Optional[Path]
    judge_response: str
    label: int


def normalize_text(text: str) -> str:
    return " ".join(text.strip().split())


def find_natural_plan(experiments_root: Path, environment_name: str) -> tuple[Optional[Path], Optional[Path]]:
    target_dir = experiments_root / environment_name
    if not target_dir.exists():
        return None, target_dir
    for candidate in target_dir.rglob("final_natural_plan.txt"):
        return candidate, target_dir
    return None, target_dir


def llm_judge(
    llm: LLM,
    golden: str,
    candidate: str,
    ignore_cost_differences: bool = False,
) -> tuple[bool, str, str]:
    system_prompt = "You are an expert evaluator that compares task solutions against golden references."
    prompt_lines = [
        "Determine whether the candidate plan achieves the same outcome as the golden plan.",
        "Ignore superficial wording differences; focus only on whether the proposed plan satisfies the goal expressed by the golden plan.",
    ]
    if ignore_cost_differences:
        prompt_lines.append(
            "If the task is Blocksworld, do not reject a candidate solely because it has a higher cost or uses more moves than the golden plan—only check that the final arrangement matches the golden plan."
        )
    prompt_lines.append("Respond strictly in JSON with keys 'match' (true/false) and 'reason'.")
    prompt = "\n".join(prompt_lines) + f"\n\nGolden plan:\n{golden}\n\nCandidate plan:\n{candidate}"
    response = llm.generate_sync(system_prompt=system_prompt, prompt=prompt)
    try:
        data = json.loads(response)
        match = bool(data.get("match"))
        reason = str(data.get("reason", ""))
        return match, reason, response
    except (json.JSONDecodeError, TypeError):
        return False, f"Failed to parse LLM response: {response}", response


def evaluate_dataset(
    data_path: Path,
    experiments_root: Path,
    llm: LLM,
    verbose: bool = False,
) -> tuple[list[ExampleResult], int, int, int, float, int]:
    with open(data_path, "r", encoding="utf-8") as f:
        dataset = json.load(f)

    sorted_items = sorted(dataset.items(), key=lambda item: item[0])
    results: list[ExampleResult] = []
    missing = 0
    total_plan_paths = 0

    accumulated_cost = 0.0
    cost_count = 0
    dataset_is_blocksworld = "blocksworld" in data_path.stem.lower()

    for key, payload in sorted_items:
        raw_golden = payload.get("golden_plan", "")
        if isinstance(raw_golden, list):
            golden = " ".join(str(item) for item in raw_golden).strip()
        elif isinstance(raw_golden, dict):
            golden = json.dumps(raw_golden, ensure_ascii=False).strip()
        else:
            golden = str(raw_golden).strip()
        parts = key.split("_")
        env_name = "".join(part.capitalize() for part in parts[:-1]) + parts[-1]
        plan_path, plan_folder = find_natural_plan(experiments_root, env_name)
        if plan_folder and plan_folder.exists():
            total_plan_paths += 1

        if not plan_path or not plan_path.exists():
            missing += 1
            if verbose:
                logging.info("[%s] skipped (no final_natural_plan)", key)
            continue

        natural = plan_path.read_text(encoding="utf-8").strip()
        if normalize_text(golden) == normalize_text(natural):
            correct = True
            reason = "Exact match after normalization"
            judge_raw = "Exact match after normalization (judge not invoked)"
        else:
            correct, reason, judge_raw = llm_judge(
                llm,
                golden,
                natural,
                ignore_cost_differences=dataset_is_blocksworld,
            )

        if verbose:
            logging.info(
                "[%s] correct=%s reason=%s plan=%s",
                key,
                correct,
                reason,
                plan_path,
            )

        latest_cost = extract_latest_plan_cost(plan_folder)
        if latest_cost is not None:
            accumulated_cost += latest_cost
            cost_count += 1

        results.append(
            ExampleResult(
                key=key,
                golden=golden,
                natural_plan=natural,
                correct=correct,
                reason=reason,
                plan_path=plan_path,
                judge_response=judge_raw,
                label=1 if correct else 0,
            )
        )

    return (
        results,
        missing,
        len(sorted_items),
        total_plan_paths,
        accumulated_cost,
        cost_count,
    )


def extract_latest_plan_cost(plan_folder: Path) -> Optional[float]:
    if not plan_folder or not plan_folder.exists():
        return None

    sas_files = sorted([p for p in plan_folder.glob("sas_plan_*") if p.is_file()])
    if not sas_files:
        return None

    latest_plan = sas_files[-1]
    try:
        last_lines = latest_plan.read_text(encoding="utf-8").strip().splitlines()
    except OSError:
        return None

    for line in reversed(last_lines):
        line = line.strip()
        if line.startswith(";") and "cost" in line:
            parts = line.split("cost =", 1)
            if len(parts) < 2:
                continue
            try:
                value_part = parts[1].split()[0]
                return float(value_part)
            except (ValueError, IndexError):
                continue
    return None


def summarize(
    results: list[ExampleResult],
    missing: int,
    dataset_total: int,
    total_plan_paths: int,
) -> tuple[int, int, int, float, float, int, float, float]:
    evaluated = len(results)
    correct = sum(1 for r in results if r.correct)

    accuracy_existing = correct / evaluated if evaluated else 0.0
    accuracy_including_missing = (
        correct / total_plan_paths if total_plan_paths else 0.0
    )

    coverage_plan_paths = (
        total_plan_paths / dataset_total if dataset_total else 0.0
    )
    coverage_outputs = (
        evaluated / dataset_total if dataset_total else 0.0
    )
    missing_plan_outputs = max(total_plan_paths - evaluated, 0)

    logging.info("================ Evaluation Summary ================")
    logging.info("Dataset examples        : %s", dataset_total)
    logging.info("Plan path folders       : %s", total_plan_paths)
    logging.info("Evaluated examples      : %s", evaluated)
    logging.info("Missing plan outputs    : %s", missing)
    logging.info(
        "Plan folders without final_natural_plan : %s", missing_plan_outputs
    )
    logging.info("Correct matches         : %s", correct)
    logging.info(
        "Accuracy (plan_path incl. missing) : %.2f%%",
        accuracy_including_missing * 100,
    )
    logging.info(
        "Accuracy (plan_path existing only) : %.2f%%",
        accuracy_existing * 100,
    )
    logging.info(
        "Coverage (plan folders vs dataset) : %.2f%%",
        coverage_plan_paths * 100,
    )
    logging.info(
        "Coverage (evaluated vs dataset)    : %.2f%%",
        coverage_outputs * 100,
    )

    return (
        evaluated,
        missing,
        dataset_total,
        accuracy_existing,
        coverage_outputs,
        total_plan_paths,
        accuracy_including_missing,
        coverage_plan_paths,
    )


def append_accuracy_result(
    accuracy_file,
    dataset_name,
    evaluated,
    missing,
    dataset_total,
    accuracy_existing,
    coverage_outputs,
    total_plan_paths,
    accuracy_including_missing,
    coverage_plan_paths,
    model,
    average_cost,
):
    results = []
    if os.path.exists(accuracy_file):
        with open(accuracy_file, "r", encoding="utf-8") as f:
            results = json.load(f)

    if not isinstance(results, list):
        results = [results]

    results.append(
        {
            "dataset": dataset_name,
            "dataset_total": dataset_total,
            "evaluated_examples": evaluated,
            "missing_examples": missing,
            "accuracy_plan_paths_existing": accuracy_existing,
            "accuracy_plan_paths_including_missing": accuracy_including_missing,
            "plan_path_count": total_plan_paths,
            "coverage_plan_paths_vs_dataset": coverage_plan_paths,
            "coverage_outputs_vs_dataset": coverage_outputs,
            "model": model,
            "average_plan_cost": average_cost,
        }
    )

    with open(accuracy_file, "w", encoding="utf-8") as f:
        json.dump(results, f, indent=2)


def write_detailed_evaluations(
    results: list[ExampleResult],
    dataset_name: str,
    model: str,
) -> Path:
    details_dir = Path("results") / "_evaluation" / "pddl"
    details_dir.mkdir(parents=True, exist_ok=True)
    output_path = details_dir / f"{dataset_name}.json"

    entries = []
    for r in results:
        entries.append(
            {
                "key": r.key,
                "golden_plan": r.golden,
                "natural_plan": r.natural_plan,
                "evaluation": {
                    "response": r.judge_response,
                    "label": r.label,
                },
            }
        )

    payload = {
        "dataset": dataset_name,
        "model": model,
        "examples": entries,
    }

    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(payload, f, indent=2, ensure_ascii=False)

    return output_path

def main() -> None:
    args = parse_args()
    logging.basicConfig(level=logging.INFO, format="%(message)s")

    if args.model not in LLM_FACTORIES:
        raise ValueError(f"Unsupported model '{args.model}'.")

    llm = LLM_FACTORIES[args.model]()
    (
        results,
        missing,
        dataset_total,
        total_plan_paths,
        cost_sum,
        cost_count,
    ) = evaluate_dataset(
        args.data_file,
        args.experiments_root,
        llm,
        verbose=args.verbose,
    )
    (
        evaluated,
        missing,
        dataset_total,
        accuracy_existing,
        coverage_outputs,
        total_plan_paths,
        accuracy_including_missing,
        coverage_plan_paths,
    ) = summarize(results, missing, dataset_total, total_plan_paths)

    average_cost = cost_sum / cost_count if cost_count else None
    if average_cost is not None:
        logging.info("Average plan cost        : %.2f", average_cost)

    dataset_name = args.data_file.stem
    accuracy_dir = Path("results") / "_accuracies"
    accuracy_dir.mkdir(parents=True, exist_ok=True)
    accuracy_file = accuracy_dir / "accuracy_pddl.json"
    append_accuracy_result(
        accuracy_file,
        dataset_name,
        evaluated,
        missing,
        dataset_total,
        accuracy_existing,
        coverage_outputs,
        total_plan_paths,
        accuracy_including_missing,
        coverage_plan_paths,
        args.model,
        average_cost,
    )
    logging.info("Accuracy written to %s", accuracy_file)
    detailed_path = write_detailed_evaluations(results, dataset_name, args.model)
    logging.info("Detailed evaluations written to %s", detailed_path)


if __name__ == "__main__":
    main()
