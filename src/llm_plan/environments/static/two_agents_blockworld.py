import random
from typing import List

from src.llm_plan.environment import Environment


class TwoAgentsBlocksworld(Environment):
    def __init__(self, num_vowels: int = 3, num_consonants: int = 3, easy: bool = True):
        """Two body-less agents A and B are in an environment with blocks labelled by letters. Agent A can only move vowel blocks
        and agent B can only move consonant blocks. The goal is to rearrange and restack blocks from one configuration to another.

        Args:
            num_vowels (int, optional): Number of vowel blocks in the environment. Defualts to 3.
            num_consonants (int, optional): Number of consonant blocks in the environment. Defaults to 3.
            easy (bool, optional): Whether easy mode is enabled. When easy mode is enabled, instances start with each block
            occupying their own stack, i.e. there are the same number of blocks as stacks, and no unstacking will be required. Defaults
            to True. If disabled, will start with a random stacked arrangement.
        """
        super(TwoAgentsBlocksworld, self).__init__()
        self.num_vowels = num_vowels
        self.num_consonants = num_consonants
        self.easy = easy
        self.vowels = ["A", "E", "I", "O", "U"]
        self.consonants = [
            "B",
            "C",
            "D",
            "F",
            "G",
            "H",
            "J",
            "K",
            "L",
            "M",
            "N",
            "P",
            "Q",
            "R",
            "S",
            "T",
            "V",
            "W",
            "X",
            "Y",
            "Z",
        ]
        self.letters = self.vowels + self.consonants
        self.public_information = [
            "I am playing with a set of blocks where I need to arrange the blocks into stacks."
            "I can perform the following actions: pick up a block; unstack a block from on top"
            "of another block; put down a block; stack a block on top of another block.",
            "I can only pick up or unstack one block at a time.",
            "I can only pick up or unstack a block if my hand is empty.",
            "I can only pick up a block if the block is on the table and the block is clear. A block is clear if the block has no other"
            "blocks on top of it and if the block is not picked up.",
            "I can only unstack a block from on top of another block if the block I am unstacking was really on top of the other block.",
            "I can only unstack a block from on top of another block if the block I am unstacking is clear.",
            "Once I pick up or unstack a block, I am holding the block.",
            "I can only put down a block that I am holding.",
            "I can only stack a block on top of another block if I am holding the block being stacked.",
            "I can only stack a block on top of another block if the block onto which I am stacking the block is clear.",
            "Once I put down or stack a block, my hand becomes empty.",
            "Once you stack a block on top of a second block, the second block is no longer clear.",
        ]

        self.knowledge = {
            "Agent A": [
                "I can only perform any action on a block if the block is a vowel.",
            ],
            "Agent B": [
                "I can only perform any action on a block if the block is a consonant.",
            ],
        }

        self.observables = {
            "Agent A": ["Agent A can move the vowel blocks"],
            "Agent B": ["Agent B can move the consonant blocks"],
        }

        # reset() will populate goal and add the initial block arrangement to public information - these are different across instances
        self.goal: dict = {}
        self._blocks_init: List[List[str]] = []
        self._blocks_goal: List[List[str]] = []

        self.reset()

    def reset(self) -> None:
        """Randomly initializes a block arrangement"""
        num_v, num_c = self.num_vowels, self.num_consonants
        v = random.sample(self.vowels, num_v)
        c = random.sample(self.consonants, num_c)
        letters = v + c
        total = num_v + num_c
        if num_v + num_c < 2 or not (0 <= num_v <= 5) or not (0 <= num_c <= 21):
            raise ValueError(
                f"Invalid number of blocks specified. Must have ar least 2 blocks in total, not {num_v + num_c}!"
            )

        bins = total
        if not self.easy:
            bins = random.randint(1, total - 1)

        def get_arrangement(bins: int, letters: List[str]) -> List[List[str]]:
            """Assigns a random arrangement for the blocks occupying exactly bins stacks."""
            bases = random.sample(letters, bins)
            stacks = [[letter] for letter in bases]
            remaining = list(set(letters) - set(bases))
            indices = random.choices(range(bins), k=len(remaining))
            for _, idx in enumerate(indices):
                stacks[idx].append(remaining.pop())
            return stacks

        def get_description(stacks: List[List[str]]) -> str:
            """
            Given stacks of uniquely labeled blocks (bottom at index 0), return a concatenated string of facts:
            - 'the A block is on the table' for each bottom block A
            - 'the block X is on top of the Y block' for each adjacent pair
            - 'the block Z is clear' for each top block Z
            """
            facts = []

            for stack in stacks:
                bottom = stack[0]
                facts.append(f"the {bottom} block is on the table")

                for below, above in zip(stack, stack[1:]):
                    facts.append(f"the block {above} is on top of the {below} block")

                top = stack[-1]
                facts.append(f"the block {top} is clear")

            if len(facts) == 1:
                return facts[0] + "."

            return ", ".join(facts[:-1]) + ", and " + facts[-1] + "."

        init_stack = get_arrangement(bins, letters)
        goal_stack = init_stack
        while init_stack == goal_stack:
            goal_stack = get_arrangement(random.randint(1, total - 1), letters)
        self._blocks_init = init_stack
        self._blocks_goal = goal_stack

        # Generate descriptions of the stacks and update the corresponding information attributes
        init_desc = get_description(self._blocks_init)
        goal_desc = get_description(self._blocks_goal)
        # goal_desc = goal_desc[0].upper() + goal_desc[1:]
        self.public_information.append(f"As initial conditions I have that {init_desc}")
        self.goal["Agent A"] = f"To use the available actions so that {goal_desc}"
        self.goal["Agent B"] = f"To use the available actions so that {goal_desc}"

    def render(self, config: str = "init") -> None:
        """
        Renders the block stacks.
        Args:
            config (str, optional): Specifies which configuration to render, 'init' or 'goal'. Defaults to 'init'.
        """
        if config == "init":
            stacks = self._blocks_init
        elif config == "goal":
            stacks = self._blocks_goal
        else:
            raise ValueError(f"Invalid config '{config}'. Expected 'init' or 'goal'.")

        sep = "    "
        max_h = max((len(s) for s in stacks), default=0)
        rows = [
            sep.join([stack[h] if len(stack) > h else " " for stack in stacks])
            for h in range(max_h)
        ]
        out = "\n".join(rows[::-1])
        print(out)
