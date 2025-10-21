import json
import random
from pathlib import Path
from typing import Dict, List

PEG_SEQUENCE = ("left", "middle", "right")


def generate_disk_labels(num_disks: int) -> List[str]:
    if num_disks < 1:
        raise ValueError("Number of disks must be at least 1.")
    if num_disks > 26:
        raise ValueError("This generator supports up to 26 disks.")
    return [chr(ord("A") + i) for i in range(num_disks)]


def snapshot(pegs: Dict[str, List[str]]) -> Dict[str, List[str]]:
    return {peg: list(stack) for peg, stack in pegs.items()}


def describe_state(state: Dict[str, List[str]]) -> str:
    parts = []
    for peg in PEG_SEQUENCE:
        stack = state[peg]
        if stack:
            disk_list = ", ".join(stack)
            parts.append(f"{peg} peg has (top→bottom) {disk_list}")
        else:
            parts.append(f"{peg} peg is empty")
    return "; ".join(parts)


def solve_hanoi(disks: List[str], source: str, target: str, auxiliary: str) -> List[Dict[str, str]]:
    if not disks:
        return []
    if len(disks) == 1:
        return [{"disk": disks[0], "from": source, "to": target}]

    smaller_solution = solve_hanoi(disks[:-1], source, auxiliary, target)
    move_largest = [{"disk": disks[-1], "from": source, "to": target}]
    restore_smaller = solve_hanoi(disks[:-1], auxiliary, target, source)
    return smaller_solution + move_largest + restore_smaller


def generate_instance(num_disks: int, instance_id: int = 0) -> Dict[str, Dict]:
    disks = generate_disk_labels(num_disks)
    initial_pegs = {
        "left": disks.copy(),
        "middle": [],
        "right": [],
    }
    goal_pegs = {
        "left": [],
        "middle": [],
        "right": disks.copy(),
    }

    initial_state = snapshot(initial_pegs)
    goal_state = snapshot(goal_pegs)

    solution = solve_hanoi(disks, "left", "right", "middle")
    cost = len(solution)

    init_desc = describe_state(initial_state)
    goal_desc = describe_state(goal_state)
    prompt = (
        "Solve a Tower of Hanoi puzzle using three pegs named left, middle, and right. "
        f"There are {num_disks} disks labelled {', '.join(disks)} from smallest ({disks[0]}) to largest ({disks[-1]}). "
        "Move one disk at a time and never place a larger disk on top of a smaller one. "
        f"Initially, {init_desc}. "
        f"The goal configuration is: {goal_desc}."
    )

    return {
        f"hanoi_{instance_id}": {
            "num_disks": num_disks,
            "disks": disks,
            "initial_state": initial_state,
            "goal": goal_state,
            "golden_plan": solution,
            "max_cost": cost,
            "prompt_0shot": prompt,
        }
    }


def generate_dataset(
    num_instances: int = 1000,
    min_disks: int = 3,
    max_disks: int = 8,
) -> Dict[str, Dict]:
    if min_disks > max_disks:
        raise ValueError("min_disks cannot be greater than max_disks.")

    dataset: Dict[str, Dict] = {}
    for i in range(num_instances):
        disk_count = random.randint(min_disks, max_disks)
        instance = generate_instance(disk_count, i)
        dataset.update(instance)
    return dataset


def save_dataset_to_json(filename: str, num_instances: int = 1000, args_generate: Dict = {}) -> None:
    dataset = generate_dataset(num_instances, **args_generate)
    with open(filename, "w") as f:
        json.dump(dataset, f, indent=4)


if __name__ == "__main__":
    save_folder = Path("./data/hanoi_scaling/")
    save_folder.mkdir(parents=True, exist_ok=True)

    disks_levels = [3, 4, 5, 6, 7]
    instances_per_level = 10

    for level in disks_levels:
        dataset_with_keys: Dict[str, Dict] = {}
        for idx in range(instances_per_level):
            raw_instance = generate_instance(level, idx)
            _, data = next(iter(raw_instance.items()))
            dataset_with_keys[f"hanoi_{level}_{idx}"] = data

        output_path = save_folder / f"hanoi_{level}_disks.json"
        with open(output_path, "w") as f:
            json.dump(dataset_with_keys, f, indent=4)
