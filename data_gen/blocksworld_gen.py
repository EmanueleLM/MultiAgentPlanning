import random
import json
from pathlib import Path
from typing import Dict, Iterable, List, Tuple

class BlocksWorld:
    def __init__(self, blocks: List[str]):
        self.blocks = blocks
        self.state = {b: 'table' for b in blocks}
        self.clear = {b: True for b in blocks}
        self.holding = None

    def _legal_actions(self):
        actions = []
        if self.holding is None:
            for b in self.blocks:
                if self.state[b] == 'table' and self.clear[b]:
                    actions.append(("pickup", b))
        if self.holding is None:
            for x in self.blocks:
                if self.state[x] != 'table':
                    y = self.state[x]
                    if self.clear[x]:
                        actions.append(("unstack", x, y))
        if self.holding is not None:
            actions.append(("putdown", self.holding))
        if self.holding is not None:
            for y in self.blocks:
                if y != self.holding and self.clear[y]:
                    actions.append(("stack", self.holding, y))
        return actions

    def apply(self, action):
        act = action[0]
        if act == "pickup":
            x = action[1]
            self.state[x] = None
            self.clear[x] = False
            self.holding = x
        elif act == "unstack":
            x, y = action[1], action[2]
            self.state[x] = None
            self.clear[x] = False
            self.clear[y] = True
            self.holding = x
        elif act == "putdown":
            x = action[1]
            self.state[x] = 'table'
            self.clear[x] = True
            self.holding = None
        elif act == "stack":
            x, y = action[1], action[2]
            self.state[x] = y
            self.clear[x] = True
            self.clear[y] = False
            self.holding = None

    def inverse(self, action):
        act = action[0]
        if act == "pickup":
            return ("putdown", action[1])
        elif act == "putdown":
            return ("pickup", action[1])
        elif act == "unstack":
            return ("stack", action[1], action[2])
        elif act == "stack":
            return ("unstack", action[1], action[2])

    def snapshot(self):
        return {
            "on": {b: self.state[b] for b in self.blocks},
            "holding": self.holding
        }


def describe_state(state: Dict) -> str:
    descs = []
    on = state["on"]
    for b, under in on.items():
        if under == 'table':
            descs.append(f"{b} is on the table")
        else:
            descs.append(f"{b} is on top of {under}")
    return ", ".join(descs)


def action_to_symbolic(action: Tuple[str, ...]) -> str:
    if len(action) == 2:
        return f"{action[0]}({action[1]})"
    if len(action) == 3:
        return f"{action[0]}({action[1]}, {action[2]})"
    return action[0]


def action_to_text(action: Tuple[str, ...]) -> str:
    act = action[0]
    if act == "pickup":
        return f"Pick up block {action[1]} from the table."
    if act == "putdown":
        return f"Put block {action[1]} down on the table."
    if act == "unstack":
        return f"Unstack block {action[1]} from block {action[2]}."
    if act == "stack":
        return f"Stack block {action[1]} on top of block {action[2]}."
    return " ".join(action)


def generate_initial_with_piles(blocks: List[str], min_piles: int = 2, max_piles: int = 4) -> BlocksWorld:
    """Generate a harder initial state by distributing blocks into multiple piles."""
    bw = BlocksWorld(blocks)
    shuffled = blocks[:]
    random.shuffle(shuffled)
    num_piles = random.randint(min_piles, min(max_piles, len(shuffled)))
    piles = [[] for _ in range(num_piles)]

    # Distribute blocks into piles
    for b in shuffled:
        random.choice(piles).append(b)

    # Build state from piles
    for pile in piles:
        if not pile:
            continue
        bw.state[pile[0]] = 'table'
        for i in range(1, len(pile)):
            bw.state[pile[i]] = pile[i-1]
            bw.clear[pile[i-1]] = False
    return bw


def _choose_action(legal: Iterable[Tuple[str, ...]], allowed: Tuple[str, ...] | None = None) -> Tuple[str, ...]:
    candidates = list(legal if allowed is None else [a for a in legal if a[0] in allowed])
    if not candidates:
        candidates = list(legal)
    if not candidates:
        raise RuntimeError("No legal actions available to sample.")
    return random.choice(candidates)


def generate_instance(num_blocks: int, action_count: int) -> Dict:
    if action_count % 2 != 0:
        raise ValueError("action_count must be even to ensure the final state has no block being held.")

    blocks = [chr(ord('A') + i) for i in range(num_blocks)]

    bw = generate_initial_with_piles(blocks, min_piles=2, max_piles=min(5, max(3, num_blocks // 2)))
    initial_state = bw.snapshot()
    initial_desc = describe_state(initial_state)

    actions_symbolic: List[str] = []
    actions_textual: List[str] = []
    actions_raw: List[List[str]] = []

    for _ in range(action_count // 2):
        first = _choose_action(bw._legal_actions(), allowed=("pickup", "unstack"))
        bw.apply(first)
        actions_symbolic.append(action_to_symbolic(first))
        actions_textual.append(action_to_text(first))
        actions_raw.append(list(first))

        second = _choose_action(bw._legal_actions(), allowed=("stack", "putdown"))
        bw.apply(second)
        actions_symbolic.append(action_to_symbolic(second))
        actions_textual.append(action_to_text(second))
        actions_raw.append(list(second))

    final_state = bw.snapshot()
    final_desc = describe_state(final_state)

    enumerated_steps = "\n".join(
        f"{idx + 1}. {step}" for idx, step in enumerate(actions_symbolic)
    )

    prompt = (
        "Two agents manipulate labelled blocks on a table following standard BlocksWorld rules: only the top block of a stack "
        "can be moved and only one block can be carried at a time. "
        f"The blocks involved are {', '.join(blocks)}. "
        f"The initial arrangement is: {initial_desc}. "
        "The agents then execute the following actions in order:\n"
        f"{enumerated_steps}\n"
        "Using the initial configuration and the actions, derive the final arrangement of the blocks. "
        "State for each block whether it is on the table or on top of another block."
    )

    return {
        "num_blocks": num_blocks,
        "blocks": blocks,
        "initial_state": initial_state,
        "actions_symbolic": actions_symbolic,
        "actions_textual": actions_textual,
        "actions": actions_raw,
        "goal": final_state,
        "golden_plan": final_desc,
        "max_cost": action_count,
        "prompt_0shot": prompt
    }


def generate_dataset(
    num_instances: int,
    action_count: int,
    min_blocks: int,
    max_blocks: int,
    key_prefix: str
) -> Dict:
    dataset = {}
    for i in range(num_instances):
        n_blocks = random.randint(min_blocks, max_blocks)
        instance_key = f"{key_prefix}_instance_{i}"
        dataset[instance_key] = generate_instance(n_blocks, action_count)
    return dataset


def save_dataset_to_json(filename: Path, dataset: Dict) -> None:
    with open(filename, "w", encoding="utf-8") as f:
        json.dump(dataset, f, indent=4)

if __name__ == "__main__":
    save_folder = Path("./data/blocksworld_scaling/")
    save_folder.mkdir(parents=True, exist_ok=True)

    num_instances_per_file = 20
    action_levels = [10, 20, 30, 40, 50]
    block_ranges = {
        10: (6, 8),
        20: (7, 10),
        30: (8, 11),
        40: (9, 12),
        50: (10, 14),
    }

    combined: Dict[str, Dict] = {}
    global_index = 0

    for actions in action_levels:
        min_blocks, max_blocks = block_ranges[actions]
        dataset = generate_dataset(
            num_instances=num_instances_per_file,
            action_count=actions,
            min_blocks=min_blocks,
            max_blocks=max_blocks,
            key_prefix=f"blocksworld_{actions}"
        )

        filename = save_folder / f"blocksworld_{actions}_actions_scaling.json"
        save_dataset_to_json(filename, dataset)

        for value in dataset.values():
            combined[f"blocksworld_{global_index}"] = value
            global_index += 1

    save_dataset_to_json(save_folder / "blocksworld_5_levels_scaling.json", combined)
