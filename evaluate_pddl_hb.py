"""Evaluate PDDL artefacts by validating domain/problem pairs against the human prompt."""

from __future__ import annotations

import argparse
import json
import logging
import re
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
        description=(
            "Evaluate PDDL artefacts by comparing domain/problem files against the "
            "human specification, and confirming that a matching sas_plan exists."
        )
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
        help="LLM used for semantic verification (default: gpt-5-nano).",
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
    index: Optional[int]
    domain_path: Optional[Path]
    problem_path: Optional[Path]
    plan_path: Optional[Path]
    correct: bool
    reason: str
    judge_response: str
    label: int


def _to_environment_name(example_key: str) -> str:
    """Convert dataset keys (snake_case) into PascalCase folder names with numeric suffix."""
    parts = example_key.split("_")
    if not parts:
        return example_key
    prefix = "".join(word.capitalize() for word in parts[:-1])
    suffix = parts[-1]
    return f"{prefix}{suffix}" if prefix else suffix


def _collect_indices(folder: Path, prefix: str, suffix: str = "") -> set[int]:
    indices: set[int] = set()
    pattern = re.compile(rf"^{re.escape(prefix)}(\d+){re.escape(suffix)}$")
    for candidate in folder.iterdir():
        match = pattern.match(candidate.name)
        if match:
            try:
                indices.add(int(match.group(1)))
            except ValueError:
                continue
    return indices


def extract_plan_cost(plan_path: Path) -> Optional[float]:
    try:
        lines = plan_path.read_text(encoding="utf-8").strip().splitlines()
    except OSError:
        return None

    for line in reversed(lines):
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


def llm_verify(
    llm: LLM,
    human_prompt: str,
    domain_text: str,
    problem_text: str,
) -> tuple[bool, str, str]:
    system_prompt = (
        "You are an expert planner verifying whether a PDDL domain/problem pair matches "
        "a human specification. Focus on whether the initial state and goal reflect the human "
        "prompt. Ignore stylistic differences."
    )
    user_prompt = (
        "Human prompt:\n"
        f"{human_prompt.strip()}\n\n"
        "Domain PDDL:\n"
        f"{domain_text.strip()}\n\n"
        "Problem PDDL:\n"
        f"{problem_text.strip()}\n\n"
        "Respond strictly in JSON with keys 'match' (true/false) and 'reason'. "
        "Set 'match' to true only if both the initial situation and the goal align with the human prompt."
    )
    response = llm.generate_sync(system_prompt=system_prompt, prompt=user_prompt)
    try:
        payload = json.loads(response)
        match = bool(payload.get("match"))
        reason = str(payload.get("reason", "")).strip() or "No reason provided."
        return match, reason, response
    except (json.JSONDecodeError, TypeError):
        return (
            False,
            f"Failed to parse LLM response as JSON. Raw response: {response}",
            response,
        )


def evaluate_dataset(
    data_path: Path,
    experiments_root: Path,
    llm: LLM,
    verbose: bool = False,
) -> tuple[list[ExampleResult], int, float, int]:
    with open(data_path, "r", encoding="utf-8") as f:
        dataset = json.load(f)

    sorted_items = sorted(dataset.items(), key=lambda item: item[0])
    results: list[ExampleResult] = []
    cost_sum = 0.0
    cost_count = 0

    for key, payload in sorted_items:
        env_name = _to_environment_name(key)
        env_folder = experiments_root / env_name
        human_prompt = payload.get("prompt_0shot", "").strip()

        domain_path: Optional[Path] = None
        problem_path: Optional[Path] = None
        plan_path: Optional[Path] = None
        judge_reason = ""
        judge_raw = ""
        final_reason = ""
        correct = False
        index: Optional[int] = None

        if not env_folder.exists():
            final_reason = f"Experiment folder '{env_folder}' not found."
        else:
            plan_indices = _collect_indices(env_folder, "sas_plan_", "")
            if not plan_indices:
                final_reason = "No 'sas_plan_<n>' files present."
            else:
                index = max(plan_indices)
                candidate_plan = env_folder / f"sas_plan_{index}"
                candidate_domain = env_folder / f"domain_{index}.pddl"
                candidate_problem = env_folder / f"problem_{index}.pddl"

                missing: list[str] = []
                if candidate_domain.exists():
                    domain_path = candidate_domain
                else:
                    missing.append(candidate_domain.name)

                if candidate_problem.exists():
                    problem_path = candidate_problem
                else:
                    missing.append(candidate_problem.name)

                if candidate_plan.exists():
                    plan_path = candidate_plan
                else:
                    missing.append(candidate_plan.name)

                if missing:
                    final_reason = (
                        f"Missing artefacts for index {index}: {', '.join(missing)}."
                    )
                else:
                    try:
                        domain_text = domain_path.read_text(encoding="utf-8")
                        problem_text = problem_path.read_text(encoding="utf-8")
                    except OSError as exc:
                        final_reason = f"Failed to read artefacts: {exc}"
                    else:
                        match, judge_reason, judge_raw = llm_verify(
                            llm,
                            human_prompt=human_prompt,
                            domain_text=domain_text,
                            problem_text=problem_text,
                        )
                        if not match:
                            final_reason = f"LLM verification failed: {judge_reason}"
                        else:
                            correct = True
                            final_reason = (
                                f"LLM verification passed: {judge_reason} "
                                f"and sas_plan_{index} exists."
                            )
                            plan_cost = extract_plan_cost(plan_path)
                            if plan_cost is not None:
                                cost_sum += plan_cost
                                cost_count += 1

        if verbose:
            logging.info(
                "[%s] correct=%s reason=%s",
                key,
                correct,
                final_reason,
            )

        results.append(
            ExampleResult(
                key=key,
                index=index,
                domain_path=domain_path,
                problem_path=problem_path,
                plan_path=plan_path,
                correct=correct,
                reason=final_reason or judge_reason or "No reason provided.",
                judge_response=judge_raw or judge_reason or final_reason,
                label=1 if correct else 0,
            )
        )

    dataset_total = len(sorted_items)
    return results, dataset_total, cost_sum, cost_count


def summarize(
    results: list[ExampleResult],
    dataset_total: int,
) -> tuple[int, int, int, int, float, float]:
    evaluated = len(results)
    correct = sum(r.label for r in results)
    incorrect = evaluated - correct
    plan_files = sum(1 for r in results if r.plan_path is not None)

    accuracy = correct / dataset_total if dataset_total else 0.0
    plan_coverage = plan_files / dataset_total if dataset_total else 0.0

    logging.info("================ Evaluation Summary ================")
    logging.info("Dataset examples        : %s", dataset_total)
    logging.info("Evaluated examples      : %s", evaluated)
    logging.info("Plan files discovered   : %s", plan_files)
    logging.info("Correct artefact sets   : %s", correct)
    logging.info("Incorrect artefact sets : %s", incorrect)
    logging.info("Accuracy                : %.2f%%", accuracy * 100)
    logging.info("Plan file coverage      : %.2f%%", plan_coverage * 100)

    return evaluated, correct, incorrect, plan_files, accuracy, plan_coverage


def append_accuracy_result(
    accuracy_file: Path,
    dataset_name: str,
    evaluated: int,
    correct: int,
    incorrect: int,
    plan_files: int,
    dataset_total: int,
    accuracy: float,
    plan_coverage: float,
    average_cost: Optional[float],
) -> None:
    payload = []
    if accuracy_file.exists():
        with open(accuracy_file, "r", encoding="utf-8") as f:
            payload = json.load(f)

    if not isinstance(payload, list):
        payload = [payload]

    payload.append(
        {
            "dataset": dataset_name,
            "dataset_total": dataset_total,
            "evaluated_examples": evaluated,
            "correct_examples": correct,
            "incorrect_examples": incorrect,
            "plan_files_found": plan_files,
            "accuracy": accuracy,
            "plan_file_coverage": plan_coverage,
            "average_plan_cost": average_cost,
        }
    )

    with open(accuracy_file, "w", encoding="utf-8") as f:
        json.dump(payload, f, indent=2)


def write_detailed_evaluations(
    results: list[ExampleResult],
    dataset_name: str,
) -> Path:
    details_dir = Path("results") / "_evaluation" / "pddl"
    details_dir.mkdir(parents=True, exist_ok=True)
    output_path = details_dir / f"{Path(dataset_name).stem}.json"

    entries = []
    for r in results:
        entries.append(
            {
                "key": r.key,
                "index": r.index,
                "domain": str(r.domain_path) if r.domain_path else None,
                "problem": str(r.problem_path) if r.problem_path else None,
                "plan": str(r.plan_path) if r.plan_path else None,
                "evaluation": {
                    "response": r.reason,
                    "judge_raw": r.judge_response,
                    "label": r.label,
                },
            }
        )

    payload = {
        "dataset": dataset_name,
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
    results, dataset_total, cost_sum, cost_count = evaluate_dataset(
        args.data_file,
        args.experiments_root,
        llm,
        verbose=args.verbose,
    )
    (
        evaluated,
        correct,
        incorrect,
        plan_files,
        accuracy,
        plan_coverage,
    ) = summarize(results, dataset_total)

    average_cost = cost_sum / cost_count if cost_count else None
    if average_cost is not None:
        logging.info("Average plan cost        : %.2f", average_cost)

    dataset_name = str(args.data_file)
    accuracy_dir = Path("results") / "_accuracies"
    accuracy_dir.mkdir(parents=True, exist_ok=True)
    accuracy_file = accuracy_dir / "accuracy_pddl.json"
    append_accuracy_result(
        accuracy_file,
        dataset_name,
        evaluated,
        correct,
        incorrect,
        plan_files,
        dataset_total,
        accuracy,
        plan_coverage,
        average_cost,
    )
    logging.info("Accuracy written to %s", accuracy_file)
    detailed_path = write_detailed_evaluations(results, dataset_name)
    logging.info("Detailed evaluations written to %s", detailed_path)


if __name__ == "__main__":
    main()
