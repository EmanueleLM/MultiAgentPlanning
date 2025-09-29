"""Batch planning pipeline driven by GPT-5 models via LangChain.

This script
1. reads natural-language planning tasks for depots and satellite domains,
2. asks a fresh GPT-5 Mini instance (medium reasoning effort) to produce a plan,
3. asks a separate fresh instance to judge the plan against the ground-truth PDDL,
4. stores the generated plans and appends batched evaluation summaries.

Each variant batch (5 instances) runs concurrently on separate threads while
batches are processed sequentially to respect rate limits.
"""

from __future__ import annotations

import os
import json
from concurrent.futures import ThreadPoolExecutor, as_completed
from dataclasses import dataclass
from datetime import datetime
from pathlib import Path
from dotenv import load_dotenv
from typing import Any, Dict, Iterable, List

from langchain_core.messages import HumanMessage, SystemMessage
from langchain_openai import ChatOpenAI

REPO_ROOT = Path(__file__).resolve().parents[3]
PROJECT_ROOT = Path(__file__).resolve().parents[2]

load_dotenv(PROJECT_ROOT / ".env")
if not os.getenv("OPENAI_API_KEY"):
    key_file = REPO_ROOT / "openai_key.txt"
    if key_file.exists():
        os.environ["OPENAI_API_KEY"] = key_file.read_text(encoding="utf-8").strip()

BASE_DIR = Path(__file__).resolve().parents[2] / "numtemp_test"
# VARIANTS = ["str", "n", "st", "t"]
VARIANTS = ["st", "t"]

PLANNER_SYSTEM_PROMPT = (
    "You are an expert classical planning assistant. You must craft a valid, "
    "sound plan for the specified {domain_label} variant {variant}, using only "
    "the provided natural-language task description. Output a list of PDDL-style"
    "grounded actions. Each action should be a single line, preceeded with the time that the action is taken, and succeeded with the duration of the action. You should try to accomplish the goal whilst minimizing the total time required. Do not add explanations."
)
PLANNER_USER_TEMPLATE = """Task description:
{description}

Produce the execution plan as:
PLAN:
time, e.g. 0.000 (action parameter1 parameter2 ...) [D:duration]
...
Ensure steps are in execution order and omit commentary.
"""

JUDGE_SYSTEM_PROMPT = (
    "You are a meticulous PDDL plan validator. Decide if the given plan "
    "satisfies the domain and problem. The action names and order of arguments "
    "don't need to match the PDDL exactly, but everything needs to be internally "
    "consistent and achieve the same goal. You can imagine that the plan is "
    "produced from a different PDDL specification based on the same problem, and "
    "your task is to check if it is essentially correct up to naming and variable "
    "ordering. Assume no prior conversation. You might want to repeat to yourself "
    "the current state of certain aspects of the environment after each action to keep track."
    "Make sure to carefully check action timings and durations to determine whether actions meet all preconditions and can be executed at the specified times."
)
JUDGE_USER_TEMPLATE = """Evaluate whether the colleague's plan reaches the goal without violating preconditions or effects. If any step is wrong or missing, mark it invalid. Respond as strict JSON with boolean field "is_valid", a short "verdict" string, and optional "issues" list.

Domain PDDL (verbatim):
{domain_pddl}

Problem PDDL (verbatim):
{problem_pddl}

Candidate plan:
{plan}
"""


@dataclass
class InstanceResult:
    instance_id: str
    plan_path: Path
    plan_text: str
    judge_raw: str
    is_valid: bool
    verdict: str
    issues: List[str]
    error: str | None = None


def create_planner() -> ChatOpenAI:
    """Return a fresh planner LLM configured for medium reasoning."""
    return ChatOpenAI(
        model="gpt-5-mini",
        reasoning={"effort": "medium"},
    )


def create_judge() -> ChatOpenAI:
    """Return a fresh judge LLM constrained to JSON output."""
    return ChatOpenAI(
        model="gpt-5-mini",
        reasoning={"effort": "high"},
        model_kwargs={"response_format": {"type": "json_object"}},
    )


def message_text(ai_message: Any) -> str:
    """Extract text content from a LangChain message."""
    content = ai_message.content
    if isinstance(content, str):
        return content
    if isinstance(content, list):
        return "".join(
            part.get("text", "") if isinstance(part, dict) else str(part)
            for part in content
        )
    return str(content)


def run_instance(
    domain_key: str,
    variant: str,
    description_path: Path,
    domain_text: str,
    problem_text: str,
    plan_output_dir: Path,
) -> InstanceResult:
    instance_id = description_path.stem
    description = description_path.read_text(encoding="utf-8").strip()

    planner = create_planner()
    planner_messages = [
        SystemMessage(
            content=PLANNER_SYSTEM_PROMPT.format(
                domain_label=domain_key.title(), variant=variant
            )
        ),
        HumanMessage(
            content=PLANNER_USER_TEMPLATE.format(description=description).strip()
        ),
    ]
    planner_reply = planner.invoke(planner_messages)
    plan_text = message_text(planner_reply).strip()

    plan_path = plan_output_dir / f"{variant}_{instance_id}_plan.txt"
    plan_path.write_text(plan_text + "\n", encoding="utf-8")

    judge = create_judge()
    judge_messages = [
        SystemMessage(content=JUDGE_SYSTEM_PROMPT),
        HumanMessage(
            content=JUDGE_USER_TEMPLATE.format(
                domain_pddl=domain_text,
                problem_pddl=problem_text,
                plan=plan_text,
            ).strip()
        ),
    ]
    judge_reply = judge.invoke(judge_messages)
    judge_text = message_text(judge_reply)

    try:
        judge_payload: Dict[str, Any] = json.loads(judge_text)
    except json.JSONDecodeError as exc:
        return InstanceResult(
            instance_id=instance_id,
            plan_path=plan_path,
            plan_text=plan_text,
            judge_raw=judge_text,
            is_valid=False,
            verdict="Malformed JSON from judge",
            issues=[f"JSON parse error: {exc}"],
        )

    is_valid = bool(judge_payload.get("is_valid"))
    verdict = str(judge_payload.get("verdict", "")) or (
        "valid" if is_valid else "invalid"
    )
    issues_field = judge_payload.get("issues", [])
    if isinstance(issues_field, list):
        issues = [str(item) for item in issues_field]
    elif issues_field:
        issues = [str(issues_field)]
    else:
        issues = []

    return InstanceResult(
        instance_id=instance_id,
        plan_path=plan_path,
        plan_text=plan_text,
        judge_raw=judge_text,
        is_valid=is_valid,
        verdict=verdict,
        issues=issues,
    )


def append_summary(
    summary_path: Path, variant: str, results: Iterable[InstanceResult]
) -> None:
    results_list = list(results)
    success_ids = [r.instance_id for r in results_list if r.is_valid]
    failure_entries = [r for r in results_list if not r.is_valid]

    header_needed = not summary_path.exists()
    summary_path.parent.mkdir(parents=True, exist_ok=True)
    timestamp = datetime.now().isoformat(timespec="seconds")
    with summary_path.open("a", encoding="utf-8") as stream:
        if header_needed:
            stream.write(f"Plan validation summary generated {timestamp}\n\n")
        stream.write(f"=== Variant {variant} ===\n")
        stream.write(f"Timestamp: {timestamp}\n")
        stream.write(f"Successful plans: {len(success_ids)} / {len(results_list)}\n")
        stream.write(
            "Successful instances: "
            + (", ".join(success_ids) if success_ids else "None")
            + "\n"
        )
        if failure_entries:
            stream.write("Failed instances:\n")
            for failure in failure_entries:
                issues_summary = "; ".join(failure.issues)
                stream.write(f"- {failure.instance_id}: {failure.verdict}")
                if issues_summary:
                    stream.write(f" | Issues: {issues_summary}")
                stream.write("\n")
        else:
            stream.write("Failed instances: None\n")
        stream.write("\n")


def run_batches() -> None:
    domain_configs = {
        "depots": {
            "nl_root": BASE_DIR / "datasets_nl" / "depots",
            "domain_prefix": "dep",
            "problem_root": BASE_DIR / "datasets_pddl" / "depots_instances",
            "plan_output": BASE_DIR / "baseline" / "depots",
            "summary_file": BASE_DIR
            / "baseline"
            / "depots"
            / "judge_report_temporal_lenient.txt",
        },
        "satellite": {
            "nl_root": BASE_DIR / "datasets_nl" / "satellite",
            "domain_prefix": "sat",
            "problem_root": BASE_DIR / "datasets_pddl" / "satellite_instances",
            "plan_output": BASE_DIR / "baseline" / "satellite",
            "summary_file": BASE_DIR
            / "baseline"
            / "satellite"
            / "judge_report_temporal_lenient.txt",
        },
    }

    for domain_key in ("depots", "satellite"):
        config = domain_configs[domain_key]
        domain_prefix = config["domain_prefix"]
        plan_output_dir = config["plan_output"]
        summary_path = config["summary_file"]
        plan_output_dir.mkdir(parents=True, exist_ok=True)

        for variant in VARIANTS:
            domain_path = (
                BASE_DIR
                / "datasets_pddl"
                / "domains"
                / f"{domain_prefix}_{variant}_domain.pddl"
            )
            if not domain_path.exists():
                print(
                    f"Domain file missing for {domain_key} variant {variant}: {domain_path}"
                )
                continue
            domain_text = domain_path.read_text(encoding="utf-8")

            nl_dir = config["nl_root"] / variant
            problem_dir = config["problem_root"] / variant
            description_files = sorted(nl_dir.glob("*.txt"))
            if not description_files:
                print(
                    f"No natural-language descriptions for {domain_key} variant {variant}; skipping batch."
                )
                continue

            print(
                f"Running batch: {domain_key} / {variant} ({len(description_files)} instances)"
            )
            results: List[InstanceResult] = []
            with ThreadPoolExecutor(
                max_workers=min(5, len(description_files))
            ) as executor:
                future_map = {}
                for description_path in description_files:
                    instance_id = description_path.stem
                    problem_path = problem_dir / instance_id
                    if not problem_path.exists():
                        print(
                            f"  Missing problem file for instance {instance_id}; marking as failure."
                        )
                        results.append(
                            InstanceResult(
                                instance_id=instance_id,
                                plan_path=plan_output_dir
                                / f"{variant}_{instance_id}_plan.txt",
                                plan_text="",
                                judge_raw="",
                                is_valid=False,
                                verdict="Missing PDDL problem file",
                                issues=[f"Expected file {problem_path}"],
                            )
                        )
                        continue
                    problem_text = problem_path.read_text(encoding="utf-8")
                    future = executor.submit(
                        run_instance,
                        domain_key,
                        variant,
                        description_path,
                        domain_text,
                        problem_text,
                        plan_output_dir,
                    )
                    future_map[future] = instance_id

                for future in as_completed(future_map):
                    instance_id = future_map[future]
                    try:
                        result = future.result()
                    except Exception as exc:
                        print(f"  ERROR - {instance_id}: {exc}")
                        results.append(
                            InstanceResult(
                                instance_id=instance_id,
                                plan_path=plan_output_dir
                                / f"{variant}_{instance_id}_plan.txt",
                                plan_text="",
                                judge_raw="",
                                is_valid=False,
                                verdict="Unhandled exception during processing",
                                issues=[str(exc)],
                                error=str(exc),
                            )
                        )
                    else:
                        results.append(result)
                        status = "PASS" if result.is_valid else "FAIL"
                        print(f"  {status} - {instance_id}: {result.verdict}")

            append_summary(summary_path, variant, results)


if __name__ == "__main__":
    run_batches()
