import json
import random
from pathlib import Path
from typing import Dict, List, Tuple

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


def assign_agents_to_disks(disks: List[str], num_agents: int) -> Tuple[List[Dict[str, List[str]]], Dict[str, str]]:
    if num_agents < 1 or num_agents > 4:
        raise ValueError("Number of agents must be between 1 and 4.")
    if num_agents > len(disks):
        raise ValueError("Number of agents cannot exceed the number of disks.")

    base = len(disks) // num_agents
    remainder = len(disks) % num_agents

    assignments: List[Dict[str, List[str]]] = []
    disk_to_agent: Dict[str, str] = {}
    cursor = 0

    for idx in range(num_agents):
        take = base + (1 if idx < remainder else 0)
        agent_name = f"agent_{idx + 1}"
        subset = disks[cursor:cursor + take]
        assignments.append({"agent": agent_name, "disks": subset})
        for disk in subset:
            disk_to_agent[disk] = agent_name
        cursor += take

    return assignments, disk_to_agent


Move = Tuple[str, str, str, str]


def generate_instance(
    num_agents: int,
    instance_id: int = 0,
    num_disks: int = 12,
    min_moves: int = 40,
    max_moves: int = 120,
) -> Dict[str, Dict]:
    if num_agents < 1 or num_agents > 4:
        raise ValueError("Number of agents must be between 1 and 4.")
    if num_disks < 3:
        raise ValueError("Number of disks must be at least 3.")
    if min_moves < 1 or max_moves < min_moves:
        raise ValueError("Move bounds must satisfy 1 ≤ min_moves ≤ max_moves.")

    disks = generate_disk_labels(num_disks)
    assignments, disk_to_agent = assign_agents_to_disks(disks, num_agents)

    initial_pegs = {
        "left": disks.copy(),
        "middle": [],
        "right": [],
    }
    initial_state = snapshot(initial_pegs)
    order_index = {disk: idx for idx, disk in enumerate(disks)}

    def legal_moves(state: Dict[str, List[str]]) -> List[Move]:
        moves: List[Move] = []
        for from_peg in PEG_SEQUENCE:
            stack = state[from_peg]
            if not stack:
                continue
            disk = stack[0]
            agent = disk_to_agent[disk]
            for to_peg in PEG_SEQUENCE:
                if to_peg == from_peg:
                    continue
                target_stack = state[to_peg]
                if target_stack and order_index[disk] > order_index[target_stack[0]]:
                    continue
                moves.append((agent, disk, from_peg, to_peg))
        return moves

    def apply_move(state: Dict[str, List[str]], move: Move) -> None:
        agent, disk, from_peg, to_peg = move
        if disk not in state[from_peg] or state[from_peg][0] != disk:
            raise RuntimeError(f"Inconsistent state when moving disk {disk} from {from_peg}.")
        state[from_peg].pop(0)
        state[to_peg].insert(0, disk)

    def is_reverse(move_a: Move, move_b: Move) -> bool:
        return (
            move_a[1] == move_b[1]
            and move_a[2] == move_b[3]
            and move_a[3] == move_b[2]
        )

    for _ in range(50):
        current_state = snapshot(initial_pegs)
        plan_structured: List[Dict[str, str]] = []
        plan_symbolic: List[str] = []
        plan_textual: List[str] = []
        previous_move: Move | None = None
        target_length = random.randint(min_moves, max_moves)

        while len(plan_structured) < target_length:
            options = legal_moves(current_state)
            if not options:
                break
            filtered = [m for m in options if previous_move is None or not is_reverse(m, previous_move)]
            if not filtered:
                filtered = options
            move = random.choice(filtered)
            apply_move(current_state, move)

            agent, disk, from_peg, to_peg = move
            step = {
                "agent": agent,
                "disk": disk,
                "from": from_peg,
                "to": to_peg,
            }
            plan_structured.append(step)
            plan_symbolic.append(f"{agent}: move({disk}, {from_peg}, {to_peg})")
            plan_textual.append(f"{agent}: Move disk {disk} from {from_peg} to {to_peg}.")
            previous_move = move

        goal_state = snapshot(current_state)

        if len(plan_structured) >= min_moves and goal_state != initial_state:
            break
    else:
        raise RuntimeError("Failed to generate a valid plan within the allotted attempts.")

    cost = len(plan_structured)
    init_desc = describe_state(initial_state)
    goal_desc = describe_state(goal_state)
    agent_descriptions = "; ".join(
        f"{entry['agent']} ⇒ {', '.join(entry['disks']) if entry['disks'] else 'no disks'}"
        for entry in assignments
    )

    prompt = (
        f"Devise a cooperative plan for a {num_agents}-agent Tower of Hanoi with {num_disks} disks labelled "
        f"{', '.join(disks)} (A is the smallest, {disks[-1]} the largest). "
        f"Agents are limited to moving specific disks: {agent_descriptions}. "
        f"Initial configuration: {init_desc}. "
        f"Goal configuration: {goal_desc}. "
        "Provide an ordered list of primitive moves in the format 'agent_i: move disk X from peg1 to peg2', "
        "respecting the agent restrictions and the Tower of Hanoi rules."
    )

    return {
        "instance_id": instance_id,
        "num_disks": num_disks,
        "num_agents": num_agents,
        "disks": disks,
        "agents": assignments,
        "initial_state": initial_state,
        "goal_state": goal_state,
        "golden_plan": plan_structured,
        "golden_plan_symbolic": plan_symbolic,
        "golden_plan_textual": plan_textual,
        "max_cost": cost,
        "min_moves": min_moves,
        "max_moves": max_moves,
        "prompt_0shot": prompt,
    }


def generate_dataset(
    agent_count: int,
    num_disks: int,
    num_instances: int,
    min_moves: int = 40,
    max_moves: int = 120,
    key_prefix: str | None = None,
) -> Dict[str, Dict]:
    if agent_count < 1 or agent_count > 4:
        raise ValueError("agent_count must be between 1 and 4.")
    if key_prefix is None:
        key_prefix = f"hanoi_{agent_count}_agents_{num_disks}_disks"

    dataset: Dict[str, Dict] = {}
    for idx in range(num_instances):
        key = f"{key_prefix}_instance_{idx}"
        dataset[key] = generate_instance(
            num_agents=agent_count,
            instance_id=idx,
            num_disks=num_disks,
            min_moves=min_moves,
            max_moves=max_moves,
        )
    return dataset


def save_dataset_to_json(filename: Path, dataset: Dict[str, Dict]) -> None:
    with open(filename, "w") as f:
        json.dump(dataset, f, indent=4)


if __name__ == "__main__":
    save_folder = Path("./data/hanoi_multi_agent/")
    save_folder.mkdir(parents=True, exist_ok=True)

    num_instances_per_file = 30
    min_moves = 40
    max_moves = 120

    schedule = [
        (2, [10, 15, 20]),
        (3, [10, 15, 20]),
        (4, [10, 15, 20]),
    ]

    for agent_count, disk_counts in schedule:
        aggregated_by_agent: Dict[str, Dict] = {}

        for disk_count in disk_counts:
            dataset = generate_dataset(
                agent_count=agent_count,
                num_disks=disk_count,
                num_instances=num_instances_per_file,
                min_moves=min_moves,
                max_moves=max_moves,
            )

            filename = save_folder / f"hanoi_{agent_count}_agents_{disk_count}_disks.json"
            save_dataset_to_json(filename, dataset)
            aggregated_by_agent.update(dataset)

        aggregated_filename = save_folder / f"hanoi_{agent_count}_agents_all_disks.json"
        save_dataset_to_json(aggregated_filename, aggregated_by_agent)
