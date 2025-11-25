from __future__ import annotations

import argparse
import json
import random
from pathlib import Path
from typing import Dict, List, Sequence, Tuple

PEG_NAMES = ("left", "middle", "right")
MAX_DISKS = 26


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Generate Tower of Hanoi instances.")
    parser.add_argument(
        "--num-instances",
        type=int,
        default=30,
        help="Number of puzzle instances to generate.",
    )
    parser.add_argument(
        "--num-disks",
        type=int,
        default=4,
        help="Number of disks to use in every instance.",
    )
    parser.add_argument(
        "--seed",
        type=int,
        default=13,
        help="Seed for the random number generator.",
    )
    parser.add_argument(
        "--output-name",
        type=str,
        default="",
        help="Optional filename for the resulting JSON. "
             "Defaults to hanoi_<k>_disks.json.",
    )
    args = parser.parse_args()
    if args.num_instances < 1:
        parser.error("num-instances must be at least 1.")
    if args.num_disks < 1:
        parser.error("num-disks must be at least 1.")
    return args


def generate_disk_labels(num_disks: int, rng: random.Random) -> List[str]:
    """Return disk labels ordered from smallest to largest."""
    del rng  # RNG is unused but kept for API compatibility.
    if num_disks > MAX_DISKS:
        raise ValueError(f"At most {MAX_DISKS} disks are supported (requested {num_disks}).")
    return [chr(ord("A") + idx) for idx in range(num_disks)]


def disk_name_for_text(label: str) -> str:
    return f"disk {label}"


def join_with_commas(items: Sequence[str]) -> str:
    if not items:
        return ""
    if len(items) == 1:
        return items[0]
    if len(items) == 2:
        return f"{items[0]} and {items[1]}"
    return f"{', '.join(items[:-1])}, and {items[-1]}"


def describe_initial_state(disk_labels: Sequence[str], start: str, auxiliary: str, goal: str) -> str:
    stack_desc = join_with_commas([disk_name_for_text(label) for label in disk_labels])
    return (
        f"the {start} peg holds, from top to bottom, {stack_desc}, while "
        f"the {auxiliary} peg and the {goal} peg are empty."
    )


def describe_goal_state(disk_labels: Sequence[str], goal: str, start: str, auxiliary: str) -> str:
    stack_desc = join_with_commas([disk_name_for_text(label) for label in disk_labels])
    return (
        f"the {goal} peg holds, from top to bottom, {stack_desc}, and both the {start} peg "
        f"and the {auxiliary} peg are empty again."
    )


def build_prompt(
    num_disks: int,
    disk_labels: Sequence[str],
    start: str,
    goal: str,
    auxiliary: str,
) -> str:
    disk_sequence = join_with_commas([disk_name_for_text(label) for label in disk_labels])
    initial_desc = describe_initial_state(disk_labels, start, auxiliary, goal)
    goal_desc = describe_goal_state(disk_labels, goal, start, auxiliary)
    return (
        "I am practicing the Tower of Hanoi puzzle. Here is the action I can do\n\n"
        "Move the top disk from one peg to another peg\n\n"
        "I must obey the following rules:\n"
        "I can move only one disk at a time.\n"
        "I may only move a disk that is on top of a peg.\n"
        "I can never place a larger disk on top of a smaller disk.\n"
        "Once a disk is moved, it keeps its relative size ordering with the others.\n\n"
        "[STATEMENT]\n"
        f"There are {num_disks} disks in total. From smallest to largest they are {disk_sequence}.\n"
        f"As initial conditions I have that, {initial_desc}\n"
        f"My goal is to have that {goal_desc}\n"
        f"The {auxiliary} peg can be used as an intermediate parking spot but must end up empty.\n\n"
        "My plan is as follows:\n\n"
        "[PLAN]"
    )


def optimal_hanoi_plan(
    disk_labels: Sequence[str],
    source: str,
    target: str,
    auxiliary: str,
) -> List[Tuple[str, str, str]]:
    moves: List[Tuple[str, str, str]] = []

    def move(stack_size: int, frm: str, to: str, spare: str) -> None:
        if stack_size == 0:
            return
        move(stack_size - 1, frm, spare, to)
        moves.append((disk_labels[stack_size - 1], frm, to))
        move(stack_size - 1, spare, to, frm)

    move(len(disk_labels), source, target, auxiliary)
    return moves


def format_plan(moves: Sequence[Tuple[str, str, str]]) -> str:
    return "".join(f"(move {disk} {frm} {to})\n" for disk, frm, to in moves)


def generate_instance(instance_id: int, num_disks: int, rng: random.Random) -> Dict[str, object]:
    disk_labels = generate_disk_labels(num_disks, rng)
    peg_order = rng.sample(PEG_NAMES, k=3)
    start, goal, auxiliary = peg_order
    plan = optimal_hanoi_plan(disk_labels, start, goal, auxiliary)
    prompt = build_prompt(num_disks, disk_labels, start, goal, auxiliary)
    return {
        "task": "task_1_plan_generation",
        "prompt_type": "oneshot",
        "domain": "hanoi",
        "instance_id": instance_id,
        "example_instance_ids": [instance_id - 1] if instance_id > 0 else [],
        "num_disks": num_disks,
        "start_peg": start,
        "goal_peg": goal,
        "auxiliary_peg": auxiliary,
        "prompt_0shot": prompt,
        "golden_plan": format_plan(plan),
    }


def build_dataset(num_instances: int, num_disks: int, rng: random.Random) -> Dict[str, Dict[str, object]]:
    dataset: Dict[str, Dict[str, object]] = {}
    for idx in range(num_instances):
        key = f"hanoi_scaling_{idx}"
        dataset[key] = generate_instance(idx, num_disks, rng)
    return dataset


def save_dataset(dataset: Dict[str, Dict[str, object]], output_path: Path) -> None:
    output_path.parent.mkdir(parents=True, exist_ok=True)
    with open(output_path, "w", encoding="utf-8") as file:
        json.dump(dataset, file, indent=4)


def main() -> None:
    args = parse_args()
    rng = random.Random(args.seed)
    dataset = build_dataset(args.num_instances, args.num_disks, rng)
    output_dir = Path("data") / "hanoi"
    if args.output_name:
        filename = args.output_name
    else:
        filename = f"hanoi_{args.num_disks}_disks.json"
    output_path = output_dir / filename
    save_dataset(dataset, output_path)
    print(f"Saved {len(dataset)} instances to {output_path}")


if __name__ == "__main__":
    main()
