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


def assign_agents_to_blocks(blocks: List[str], num_agents: int) -> Tuple[List[Dict[str, List[str]]], Dict[str, str]]:
    if num_agents < 1 or num_agents > 4:
        raise ValueError("Number of agents must be between 1 and 4.")
    if num_agents > len(blocks):
        raise ValueError("Number of agents cannot exceed number of blocks.")

    base = len(blocks) // num_agents
    remainder = len(blocks) % num_agents

    assignments: List[Dict[str, List[str]]] = []
    block_to_agent: Dict[str, str] = {}
    cursor = 0

    for idx in range(num_agents):
        take = base + (1 if idx < remainder else 0)
        agent_name = f"agent_{idx + 1}"
        subset = blocks[cursor:cursor + take]
        assignments.append({"agent": agent_name, "blocks": subset})
        for block in subset:
            block_to_agent[block] = agent_name
        cursor += take

    return assignments, block_to_agent


def generate_instance(num_agents: int, instance_id: int = 0) -> Dict:
    if num_agents < 1 or num_agents > 4:
        raise ValueError("Number of agents must be between 1 and 4.")

    blocks = [chr(ord('A') + i) for i in range(12)]
    assignments, block_to_agent = assign_agents_to_blocks(blocks, num_agents)

    bw = generate_initial_with_piles(blocks, min_piles=3, max_piles=4)
    initial_state = bw.snapshot()
    initial_desc = describe_state(initial_state)

    target_stack_bottom_to_top = blocks[:]
    while True:
        random.shuffle(target_stack_bottom_to_top)
        if target_stack_bottom_to_top != blocks:
            break

    plan_symbolic: List[str] = []
    plan_textual: List[str] = []
    plan_structured: List[Dict[str, str]] = []

    def record_action(agent: str, action: Tuple[str, ...]) -> None:
        plan_symbolic.append(f"{agent}: {action_to_symbolic(action)}")
        plan_textual.append(f"{agent}: {action_to_text(action)}")

        step: Dict[str, str] = {"agent": agent, "action": action[0], "block": action[1]}
        if action[0] == "unstack":
            step["from"] = action[2]
        elif action[0] == "stack":
            step["onto"] = action[2]
        elif action[0] == "pickup":
            step["from"] = "table"
        elif action[0] == "putdown":
            step["to"] = "table"
        plan_structured.append(step)

    def block_on_top_of(target: str) -> str | None:
        for block, under in bw.state.items():
            if under == target:
                return block
        return None

    def move_block_to_table(block: str) -> None:
        if bw.state[block] == "table":
            return
        top = block_on_top_of(block)
        if top is not None:
            move_block_to_table(top)
        if bw.state[block] != "table":
            support = bw.state[block]
            agent = block_to_agent[block]
            action_unstack = ("unstack", block, support)
            record_action(agent, action_unstack)
            bw.apply(action_unstack)
            action_putdown = ("putdown", block)
            record_action(agent, action_putdown)
            bw.apply(action_putdown)

    for block in blocks:
        move_block_to_table(block)

    for block in blocks:
        if bw.state[block] != "table":
            raise RuntimeError("Failed to move all blocks to the table before building goal stack.")

    base = target_stack_bottom_to_top[0]
    move_block_to_table(base)
    current_top = base

    for block in target_stack_bottom_to_top[1:]:
        move_block_to_table(block)
        agent = block_to_agent[block]
        pickup_action = ("pickup", block)
        record_action(agent, pickup_action)
        bw.apply(pickup_action)
        stack_action = ("stack", block, current_top)
        record_action(agent, stack_action)
        bw.apply(stack_action)
        current_top = block

    final_state = bw.snapshot()
    goal_desc = describe_state(final_state)

    agent_descriptions = "; ".join(
        f"{entry['agent']} ⇒ {', '.join(entry['blocks']) if entry['blocks'] else 'no blocks'}"
        for entry in assignments
    )

    target_stack_top_to_bottom = list(reversed(target_stack_bottom_to_top))
    target_bottom_to_top_str = ", ".join(target_stack_bottom_to_top)

    prompt = (
        f"Plan a coordinated BlocksWorld reordering task with {num_agents} agent(s). "
        "Only the top block of any stack can be moved and agents can hold at most one block at a time. "
        f"Blocks are labelled {', '.join(blocks)}. "
        f"Agent capabilities: {agent_descriptions}. "
        f"Initial arrangement: {initial_desc}. "
        f"Goal: build a single stack on the table with blocks ordered bottom→top as {target_bottom_to_top_str}. "
        "Return a sequence of primitive actions where each step is prefixed by the responsible agent. "
        "Use only actions pickup(X), putdown(X), unstack(X, Y), and stack(X, Y) consistent with the agent permissions."
    )

    return {
        "instance_id": instance_id,
        "num_blocks": len(blocks),
        "num_agents": num_agents,
        "blocks": blocks,
        "agents": assignments,
        "initial_state": initial_state,
        "goal_state": final_state,
        "target_stack_bottom_to_top": target_stack_bottom_to_top,
        "target_stack_top_to_bottom": target_stack_top_to_bottom,
        "golden_plan": plan_structured,
        "golden_plan_symbolic": plan_symbolic,
        "golden_plan_textual": plan_textual,
        "max_cost": len(plan_structured),
        "prompt_0shot": prompt,
    }


def generate_dataset(
    num_instances_per_agent: int,
    agent_counts: Iterable[int] = (1, 2, 3, 4),
    key_prefix: str = "blocksworld"
) -> Dict:
    dataset: Dict[str, Dict] = {}
    for agent_count in agent_counts:
        if agent_count < 1 or agent_count > 4:
            raise ValueError("agent_counts must contain values between 1 and 4.")
        for idx in range(num_instances_per_agent):
            instance_key = f"{key_prefix}_{agent_count}_agents_instance_{idx}"
            dataset[instance_key] = generate_instance(agent_count, instance_id=idx)
    return dataset


def save_dataset_to_json(filename: Path, dataset: Dict) -> None:
    with open(filename, "w", encoding="utf-8") as f:
        json.dump(dataset, f, indent=4)


if __name__ == "__main__":
    save_folder = Path("./data/blocksworld_multi_agent/")
    save_folder.mkdir(parents=True, exist_ok=True)

    num_instances_per_agent = 20
    agent_counts = [1, 2, 3, 4]

    combined: Dict[str, Dict] = {}
    global_index = 0

    for agent_count in agent_counts:
        dataset: Dict[str, Dict] = {}
        for idx in range(num_instances_per_agent):
            key = f"blocksworld_{agent_count}_agents_instance_{idx}"
            dataset[key] = generate_instance(agent_count, instance_id=idx)
            combined[f"blocksworld_{global_index}"] = dataset[key]
            global_index += 1

        filename = save_folder / f"blocksworld_{agent_count}_agents.json"
        save_dataset_to_json(filename, dataset)

    save_dataset_to_json(save_folder / "blocksworld_all_agents.json", combined)
