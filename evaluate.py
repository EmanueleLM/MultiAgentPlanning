"""Evaluate natural-language plan outputs against golden plans using an LLM judge."""

from __future__ import annotations

import argparse
import json
import logging
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


def normalize_text(text: str) -> str:
    return " ".join(text.strip().split())


def find_natural_plan(experiments_root: Path, environment_name: str) -> Optional[Path]:
    target_dir = experiments_root / environment_name
    if not target_dir.exists():
        return None
    for candidate in target_dir.rglob("final_natural_plan.txt"):
        return candidate
    return None


def llm_judge(llm: LLM, golden: str, candidate: str) -> tuple[bool, str]:
    system_prompt = "You are an expert evaluator for calendar scheduling plans."
    prompt = (
        "Determine whether the candidate plan achieves the same meeting time as the golden plan.\n"
        "Ignore wording differences; focus on whether the proposed meeting interval (day, start, end) matches."\
        "\nRespond strictly in JSON with keys 'match' (true/false) and 'reason'."\
        f"\n\nGolden plan:\n{golden}\n\nCandidate plan:\n{candidate}"
    )
    response = llm.generate_sync(system_prompt=system_prompt, prompt=prompt)
    try:
        data = json.loads(response)
        match = bool(data.get("match"))
        reason = str(data.get("reason", ""))
        return match, reason
    except (json.JSONDecodeError, TypeError):
        return False, f"Failed to parse LLM response: {response}"


def evaluate_dataset(
    data_path: Path,
    experiments_root: Path,
    llm: LLM,
    verbose: bool = False,
) -> list[ExampleResult]:
    with open(data_path, "r", encoding="utf-8") as f:
        dataset = json.load(f)

    sorted_items = sorted(dataset.items(), key=lambda item: item[0])
    results: list[ExampleResult] = []

    for key, payload in sorted_items:
        print(f"Evaluating {key}...")
        golden = payload.get("golden_plan", "").strip()
        parts = key.split("_")
        env_name = "".join(part.capitalize() for part in parts[:-1]) + parts[-1]
        plan_path = find_natural_plan(experiments_root, env_name)
        natural = None
        correct = False
        reason = "final_natural_plan.txt not found"

        if plan_path and plan_path.exists():
            natural = plan_path.read_text(encoding="utf-8").strip()
            if normalize_text(golden) == normalize_text(natural):
                correct = True
                reason = "Exact match after normalization"
            else:
                correct, reason = llm_judge(llm, golden, natural)

        if verbose:
            logging.info(
                "[%s] correct=%s reason=%s plan=%s",
                key,
                correct,
                reason,
                plan_path if plan_path else "<missing>",
            )

        results.append(
            ExampleResult(
                key=key,
                golden=golden,
                natural_plan=natural,
                correct=correct,
                reason=reason,
                plan_path=plan_path,
            )
        )

    return results


def summarize(results: list[ExampleResult]) -> tuple[int, int, float]:
    total = len(results)
    evaluated = sum(1 for r in results if r.natural_plan is not None)
    correct = sum(1 for r in results if r.correct)
    accuracy = correct / total if evaluated else 0.0
    accuracy_evaluated = correct / evaluated if evaluated else 0.0

    logging.info("================ Evaluation Summary ================")
    logging.info("Total examples          : %s", total)
    logging.info("With natural plan output: %s", evaluated)
    logging.info("Correct matches         : %s", correct)
    logging.info("Accuracy (total)    : %.2f%%", accuracy * 100)
    logging.info("Accuracy (evaluated)    : %.2f%%", accuracy_evaluated * 100)
    return total, evaluated, accuracy, accuracy_evaluated


def main() -> None:
    args = parse_args()
    logging.basicConfig(level=logging.INFO, format="%(message)s")

    if args.model not in LLM_FACTORIES:
        raise ValueError(f"Unsupported model '{args.model}'.")

    llm = LLM_FACTORIES[args.model]()
    results = evaluate_dataset(
        args.data_file,
        args.experiments_root,
        llm,
        verbose=args.verbose,
    )
    total, evaluated, accuracy, accuracy_evaluated = summarize(results)

    dataset_name = args.data_file.stem
    accuracy_dir = Path("results") / "_accuracies" / dataset_name
    accuracy_dir.mkdir(parents=True, exist_ok=True)
    accuracy_file = accuracy_dir / "accuracy.json"
    with open(accuracy_file, "w", encoding="utf-8") as f:
        f.write(
            json.dumps(
                {
                    "dataset": dataset_name,
                    "total_examples": total,
                    "evaluated_examples": evaluated,
                    "accuracy": accuracy,
                    "accuracy_evaluated": accuracy_evaluated,
                    "model": args.model,
                },
                indent=2,
            )
        )
    logging.info("Accuracy written to %s", accuracy_file)


if __name__ == "__main__":
    main()
