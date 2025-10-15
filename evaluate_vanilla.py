"""Evaluate natural-language plan outputs against golden plans using an LLM judge."""

from __future__ import annotations

import argparse
import json
import logging
from dataclasses import dataclass
from pathlib import Path
from typing import Callable

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
            "Evaluate natural plans against golden plans using an LLM judge.\n"
            "Example usage: python3 evaluate_vanilla.py ./results/google/meeting_planning/vanilla_llm/gpt-5-mini.json --model gpt-5-mini"
        )
    )
    parser.add_argument(
        "data_file",
        type=Path,
        help="Path to the evaluation JSON containing golden plans and model responses.",
    )
    parser.add_argument(
        "--model",
        default="gpt-5-nano",
        choices=LLM_FACTORIES.keys(),
        help="LLM used for semantic comparison (default: gpt-5-nano).",
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
    response: str
    correct: bool
    reason: str


def normalize_text(text: str) -> str:
    return " ".join(text.strip().split())


def llm_judge(llm: LLM, golden: str, candidate: str) -> tuple[bool, str]:
    system_prompt = "You are an expert evaluator for calendar scheduling plans."
    prompt = (
        "Determine whether the candidate plan achieves the same meeting time as the golden plan.\n"
        "Ignore wording differences; focus on whether the proposed plan matches with the ground truth label. Remember that they can be written in different ways: what matters is that the result in the proposed solution matches that of the ground truth plan."
        "\nRespond strictly in JSON with keys 'match' (true/false) and 'reason'."
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
    llm: LLM,
    verbose: bool = False,
) -> tuple[list[ExampleResult], int, int]:
    with open(data_path, "r", encoding="utf-8") as f:
        dataset = json.load(f)

    sorted_items = sorted(dataset.items(), key=lambda item: item[0])
    results: list[ExampleResult] = []
    missing = 0

    for key, payload in sorted_items:
        raw_golden = payload.get("golden_plan", "")
        if isinstance(raw_golden, list):
            golden = " ".join(str(item) for item in raw_golden).strip()
        elif isinstance(raw_golden, dict):
            golden = json.dumps(raw_golden, ensure_ascii=False).strip()
        else:
            golden = str(raw_golden).strip()

        response = payload.get("response")
        if response is None:
            missing += 1
            if verbose:
                logging.info("[%s] skipped (no model response)", key)
            continue

        if isinstance(response, list):
            candidate_text = " ".join(str(item) for item in response).strip()
        elif isinstance(response, dict):
            candidate_text = json.dumps(response, ensure_ascii=False).strip()
        else:
            candidate_text = str(response).strip()

        if normalize_text(golden) == normalize_text(candidate_text):
            correct = True
            reason = "Exact match after normalization"
        else:
            correct, reason = llm_judge(llm, golden, candidate_text)

        if verbose:
            logging.info("[%s] correct=%s reason=%s", key, correct, reason)

        results.append(
            ExampleResult(
                key=key,
                golden=golden,
                response=candidate_text,
                correct=correct,
                reason=reason,
            )
        )

    return results, missing, len(sorted_items)


def summarize(
    results: list[ExampleResult],
    missing: int,
    dataset_total: int,
) -> tuple[int, int, int, float, float, float]:
    evaluated = len(results)
    correct = sum(1 for r in results if r.correct)

    accuracy_existing = correct / evaluated if evaluated else 0.0
    accuracy_including_missing = correct / dataset_total if dataset_total else 0.0
    coverage_outputs = evaluated / dataset_total if dataset_total else 0.0

    logging.info("================ Evaluation Summary ================")
    logging.info("Dataset examples        : %s", dataset_total)
    logging.info("Evaluated examples      : %s", evaluated)
    logging.info("Missing responses       : %s", missing)
    logging.info("Correct matches         : %s", correct)
    logging.info(
        "Accuracy (evaluated only)          : %.2f%%",
        accuracy_existing * 100,
    )
    logging.info(
        "Accuracy (including missing)       : %.2f%%",
        accuracy_including_missing * 100,
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
        accuracy_including_missing,
    )


def append_accuracy_result(
    accuracy_file: Path,
    dataset_name: str,
    evaluated: int,
    missing: int,
    dataset_total: int,
    accuracy_existing: float,
    coverage_outputs: float,
    accuracy_including_missing: float,
    model: str,
) -> None:
    results: list[dict] = []
    if accuracy_file.exists():
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
            "accuracy_evaluated_only": accuracy_existing,
            "accuracy_including_missing": accuracy_including_missing,
            "coverage_outputs_vs_dataset": coverage_outputs,
            "model": model,
        }
    )

    with open(accuracy_file, "w", encoding="utf-8") as f:
        json.dump(results, f, indent=2)


def main() -> None:
    args = parse_args()
    logging.basicConfig(level=logging.INFO, format="%(message)s")

    if args.model not in LLM_FACTORIES:
        raise ValueError(f"Unsupported model '{args.model}'.")

    llm = LLM_FACTORIES[args.model]()
    results, missing, dataset_total = evaluate_dataset(
        args.data_file,
        llm,
        verbose=args.verbose,
    )
    (
        evaluated,
        missing,
        dataset_total,
        accuracy_existing,
        coverage_outputs,
        accuracy_including_missing,
    ) = summarize(results, missing, dataset_total)

    dataset_name = args.data_file
    accuracy_dir = Path("results") / "_accuracies"
    accuracy_dir.mkdir(parents=True, exist_ok=True)
    accuracy_file = accuracy_dir / "accuracy_vanilla.json"
    append_accuracy_result(
        accuracy_file,
        str(dataset_name),
        evaluated,
        missing,
        dataset_total,
        accuracy_existing,
        coverage_outputs,
        accuracy_including_missing,
        args.model,
    )
    logging.info("Accuracy written to %s", accuracy_file)


if __name__ == "__main__":
    main()
