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


def find_natural_plan(environment_name: str, results_root: Path = Path("results")) -> Optional[Path]:
    if not results_root.exists():
        return None
    target = environment_name
    for candidate in results_root.rglob("final_natural_plan.txt"):
        if candidate.parent.name == target:
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


def evaluate_dataset(data_path: Path, llm: LLM, verbose: bool = False) -> list[ExampleResult]:
    with open(data_path, "r", encoding="utf-8") as f:
        dataset = json.load(f)

    sorted_items = sorted(dataset.items(), key=lambda item: item[0])
    results: list[ExampleResult] = []

    for key, payload in sorted_items:
        golden = payload.get("golden_plan", "").strip()
        env_name = "".join(part.capitalize() for part in key.split("_"))
        plan_path = find_natural_plan(env_name)
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


def summarize(results: list[ExampleResult]) -> None:
    total = len(results)
    evaluated = sum(1 for r in results if r.natural_plan is not None)
    correct = sum(1 for r in results if r.correct)
    accuracy = correct / evaluated if evaluated else 0.0

    logging.info("================ Evaluation Summary ================")
    logging.info("Total examples          : %s", total)
    logging.info("With natural plan output: %s", evaluated)
    logging.info("Correct matches         : %s", correct)
    logging.info("Accuracy (evaluated)    : %.2f%%", accuracy * 100)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Evaluate natural plans against golden plans using an LLM judge."
    )
    parser.add_argument(
        "data_file",
        type=Path,
        help="Path to the dataset JSON file inside data/<folder>.",
    )
    parser.add_argument(
        "--model",
        default="gpt-4o",
        choices=LLM_FACTORIES.keys(),
        help="LLM used for semantic comparison (default: gpt-4o).",
    )
    parser.add_argument(
        "--verbose",
        action="store_true",
        help="Log per-example evaluation details.",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    logging.basicConfig(level=logging.INFO, format="%(message)s")

    if args.model not in LLM_FACTORIES:
        raise ValueError(f"Unsupported model '{args.model}'.")

    llm = LLM_FACTORIES[args.model]()
    results = evaluate_dataset(args.data_file, llm, verbose=args.verbose)
    summarize(results)


if __name__ == "__main__":
    main()

