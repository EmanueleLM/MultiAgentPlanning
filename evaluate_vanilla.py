"""Evaluate natural-language plan outputs against golden plans using an LLM judge."""

from __future__ import annotations

import argparse
import json
import logging
from dataclasses import dataclass
from pathlib import Path
from typing import Callable, Dict, List

from src.llm_plan.config import DATASET, PROMPTS_LLM_JUDGE
from src.llm_plan.llm import ChatGPT, Gemini, LLM


LLM_FACTORIES: Dict[str, Callable[[], LLM]] = {
    "gpt-4o": lambda: ChatGPT("gpt-4o"),
    "gpt-5-mini": lambda: ChatGPT("gpt-5-mini"),
    "gpt-5-nano": lambda: ChatGPT("gpt-5-nano"),
    "gemini-2.5-flash": lambda: Gemini("gemini-2.5-flash"),
    "gemini-2.5-pro": lambda: Gemini("gemini-2.5-pro"),
}

DATASET_KEYS: List[str] = sorted(DATASET.keys())
GENERIC_PROMPT_KEY = ""
PROMPT_CHOICES: List[str] = [GENERIC_PROMPT_KEY, *DATASET_KEYS]

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
    parser.add_argument(
        "--dataset-name",
        choices=DATASET_KEYS,
        help=(
            "Logical dataset identifier from src.llm_plan.config.DATASET. "
            "If omitted, the path to the data_file is used in reports."
        ),
    )
    parser.add_argument(
        "--prompt-key",
        choices=PROMPT_CHOICES,
        default=GENERIC_PROMPT_KEY,
        help=(
            "Choose a handcrafted judge prompt. "
            "Leave empty (default) to use the generic prompt or select a dataset key."
        ),
    )
    return parser.parse_args()


@dataclass
class ExampleResult:
    key: str
    golden: str
    response: str
    correct: bool
    reason: str
    judge_response: str
    label: int
    prompt_0shot: str = ""


def normalize_text(text: str) -> str:
    return " ".join(text.strip().split())


def build_judge_prompt_lines(prompt_key: str) -> list[str]:
    base_lines = [
        "Determine whether the candidate plan achieves the same outcome as the golden plan.",
        "Ignore superficial wording differences; focus on whether the proposed plan satisfies the goal expressed by the golden plan.",
    ]
    if prompt_key:
        base_lines.extend(PROMPTS_LLM_JUDGE.get(prompt_key, []))
    return base_lines


def llm_judge(
    llm: LLM,
    golden: str,
    candidate: str,
    ignore_cost_differences: bool = False,
    prompt_key: str = GENERIC_PROMPT_KEY,
    prompt_0shot: str = "",
) -> tuple[bool, str, str]:
    system_prompt = "You are an expert evaluator that compares task solutions against golden references."
    prompt_lines = build_judge_prompt_lines(prompt_key)
    prompt_header = [
        "You will receive three artefacts in this order:",
        "1. The original prompt that the model responded to (prompt_0shot).",
        "2. The golden reference plan.",
        "3. The candidate plan to evaluate.",
        "Read the prompt first to understand the task constraints, then examine the golden plan, and finally judge whether the candidate satisfies the golden plan under the prompt.",
    ]
    prompt_lines = prompt_header + prompt_lines
    if ignore_cost_differences:
        prompt_lines.append(
            "If the task is Blocksworld, do not reject a candidate solely because it has a higher cost or uses more moves than the golden plan—only check that the final arrangement matches the golden plan."
        )
    prompt_lines.append("Respond strictly in JSON with keys 'match' (true/false) and 'reason'.")
    prompt = (
        "\n".join(prompt_lines)
        + "\n\nOriginal prompt (prompt_0shot):\n"
        + (prompt_0shot or "[none provided]")
        + f"\n\nGolden plan:\n{golden}\n\nCandidate plan:\n{candidate}"
    )
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
    llm: LLM,
    verbose: bool = False,
    prompt_key: str = GENERIC_PROMPT_KEY,
) -> tuple[list[ExampleResult], int, int]:
    with open(data_path, "r", encoding="utf-8") as f:
        dataset = json.load(f)

    sorted_items = sorted(dataset.items(), key=lambda item: item[0])
    results: list[ExampleResult] = []
    missing = 0
    dataset_is_blocksworld = "blocksworld" in data_path.stem.lower() or (
        prompt_key and prompt_key.lower() == "blocksworld"
    )

    for key, payload in sorted_items:
        raw_prompt = payload.get("prompt_0shot", "")
        raw_golden = payload.get("golden_plan", "")
        if isinstance(raw_golden, list):
            golden = " ".join(str(item) for item in raw_golden).strip()
        elif isinstance(raw_golden, dict):
            golden = json.dumps(raw_golden, ensure_ascii=False).strip()
        else:
            golden = str(raw_golden).strip()
        prompt_text = (
            " ".join(str(item) for item in raw_prompt).strip()
            if isinstance(raw_prompt, list)
            else (json.dumps(raw_prompt, ensure_ascii=False).strip() if isinstance(raw_prompt, dict) else str(raw_prompt).strip())
        )

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
            judge_raw = "Exact match after normalization (judge not invoked)"
        else:
            correct, reason, judge_raw = llm_judge(
                llm,
                golden,
                candidate_text,
                ignore_cost_differences=dataset_is_blocksworld,
                prompt_key=prompt_key,
                prompt_0shot=prompt_text,
            )

        if verbose:
            logging.info("[%s] correct=%s reason=%s", key, correct, reason)

        results.append(
            ExampleResult(
                key=key,
                golden=golden,
                response=candidate_text,
                correct=correct,
                reason=reason,
                judge_response=judge_raw,
                label=1 if correct else 0,
                prompt_0shot=prompt_text,
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
    prompt_key: str,
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
            "accuracy": accuracy_including_missing,
            "coverage_outputs_vs_dataset": coverage_outputs,
            "model": model,
            "prompt_key": prompt_key if prompt_key else "generic",
        }
    )

    with open(accuracy_file, "w", encoding="utf-8") as f:
        json.dump(results, f, indent=2)


def write_detailed_evaluations(
    results: list[ExampleResult],
    dataset_name: str,
    model: str,
    prompt_key: str,
) -> Path:
    output_dir = Path("results") / "_evaluation" / "vanilla"
    output_dir.mkdir(parents=True, exist_ok=True)
    output_path = output_dir / f"{Path(dataset_name).stem}.json"

    entries = []
    for r in results:
        entries.append(
            {
                "key": r.key,
                "golden_plan": r.golden,
                "prompt_0shot": r.prompt_0shot,
                "response": r.response,
                "evaluation": {
                    "response": r.judge_response,
                    "label": r.label,
                },
            }
        )

    payload = {
        "dataset": dataset_name,
        "model": model,
        "prompt_key": prompt_key if prompt_key else "generic",
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

    dataset_label = args.dataset_name or str(args.data_file)
    prompt_key = args.prompt_key or GENERIC_PROMPT_KEY

    logging.info("Dataset label        : %s", dataset_label)
    logging.info("Hand-made prompt key : %s", prompt_key if prompt_key else "generic")

    llm = LLM_FACTORIES[args.model]()
    results, missing, dataset_total = evaluate_dataset(
        args.data_file,
        llm,
        verbose=args.verbose,
        prompt_key=prompt_key,
    )
    (
        evaluated,
        missing,
        dataset_total,
        accuracy_existing,
        coverage_outputs,
        accuracy_including_missing,
    ) = summarize(results, missing, dataset_total)

    accuracy_dir = Path("results") / "_accuracies"
    accuracy_dir.mkdir(parents=True, exist_ok=True)
    accuracy_file = accuracy_dir / "accuracy_vanilla.json"
    append_accuracy_result(
        accuracy_file,
        dataset_label,
        evaluated,
        missing,
        dataset_total,
        accuracy_existing,
        coverage_outputs,
        accuracy_including_missing,
        args.model,
        prompt_key,
    )
    logging.info("Accuracy written to %s", accuracy_file)
    detailed_path = write_detailed_evaluations(results, dataset_label, args.model, prompt_key)
    logging.info("Detailed evaluations written to %s", detailed_path)


if __name__ == "__main__":
    main()
