from fileinput import filename
import random
import json
from pathlib import Path
from typing import List, Tuple, Dict

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


def generate_initial_with_piles(blocks: List[str], min_piles: int = 2, max_piles: int = 4) -> BlocksWorld:
    """Generate a harder initial state by distributing blocks into multiple piles."""
    bw = BlocksWorld(blocks)
    random.shuffle(blocks)
    num_piles = random.randint(min_piles, min(max_piles, len(blocks)))
    piles = [[] for _ in range(num_piles)]

    # Distribute blocks into piles
    for b in blocks:
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


def generate_instance(num_blocks: int, scramble_steps: int, instance_id: int = 1) -> Dict:
    blocks = [chr(ord('A') + i) for i in range(num_blocks)]

    # Define canonical goal: stack all blocks in order A on B on C ...
    goal_bw = BlocksWorld(blocks)
    for i in range(1, num_blocks):
        goal_bw.state[blocks[i-1]] = blocks[i]
        goal_bw.clear[blocks[i]] = False
    goal_bw.state[blocks[-1]] = 'table'
    goal_bw.holding = None
    goal = goal_bw.snapshot()

    # Generate initial state with multiple piles for complexity
    init_bw = generate_initial_with_piles(blocks)

    # Scramble backwards from goal to ensure solvability
    scramble_actions = []
    for _ in range(scramble_steps):
        legal = goal_bw._legal_actions()
        if not legal:
            break
        act = random.choice(legal)
        goal_bw.apply(act)
        scramble_actions.append(act)

    scrambled_init = init_bw.snapshot()
    solution = [goal_bw.inverse(a) for a in reversed(scramble_actions)]
    cost = len(solution)

    init_desc = describe_state(scrambled_init)
    goal_desc = describe_state(goal)
    prompt = (
        "Two agents are tasked with manipulating blocks arranged in stacks on a table, from one configuration to another. "
        "Each block is uniquely labelled by a letter. Both agents can only interact with blocks at the top of each stack, and only interact with one block at a time. "
        "Additionally, one agent can only interact with vowel blocks, and the other can only interact with consonant blocks. "
        f"Initially there are blocks {', '.join(blocks)}. {init_desc}. "
        f"The goal is to have {goal_desc}."
    )

    return {
        f"blocksworld_{instance_id}": {
            "num_blocks": num_blocks,
            "blocks": blocks,
            "initial_state": scrambled_init,
            "goal": goal,
            "golden_plan": solution,
            "max_cost": cost,
            "prompt_0shot": prompt
        }
    }


def generate_dataset(
    num_instances: int = 1000, 
    min_blocks: int = 10, 
    max_blocks: int = 15, 
    min_steps: int = 10, 
    max_steps: int = 20
    ) -> Dict:
    dataset = {}
    for i in range(num_instances):
        n_blocks = random.randint(min_blocks, max_blocks)
        steps = random.randint(min_steps, max_steps)
        instance = generate_instance(n_blocks, steps, i)
        dataset.update(instance)
    return dataset


def save_dataset_to_json(filename: str, num_instances: int = 1000, args_generate: Dict = {}):
    dataset = generate_dataset(num_instances, **args_generate)
    with open(filename, 'w') as f:
        json.dump(dataset, f, indent=4)

if __name__ == "__main__":
    save_folder = Path("./data/blocksworld_scaling/")
    save_folder.mkdir(parents=True, exist_ok=True)

    num_instances_per_file = 30
    dataset_with_keys = {}
    for i, min_steps in enumerate([20, 30, 40, 50, 60]):
        min_blocks, max_blocks = 10, 15
        max_steps = min_steps + 5
        args = {
            "min_blocks": min_blocks,
            "max_blocks": max_blocks,
            "min_steps": min_steps,
            "max_steps": max_steps
        }
        # Generate and save 30 instances to a JSON file
        dataset = generate_dataset(num_instances=num_instances_per_file, **args)
        counter = 0
        for k,v in dataset.items():
            key = f"blocksworld_{(i*num_instances_per_file) + counter}"
            dataset_with_keys[key] = v
            counter += 1
        
    with open("./data/blocksworld_scaling/blocksworld_5_levels_scaling.json", 'w') as f:
        json.dump(dataset_with_keys, f, indent=4)
            