import random
from typing import List

from src.llm_plan.environment import Environment

# Separate data from logic
# Public information (may need formatting)
_PUBLIC_INFO = [
    "I can move blocks between stacks.",
    "I can only move one block at a time.",
    "I can only move a block if there is no other block on top of it (the block is clear).",
    "Once I move a block, I can place it either on the table (start a new stack) or on top of another clear block.",
    "As initial conditions: {initial_conditions}",
]

# Agent information
_KNOWLEDGE = [
    "I am the only agent in this environment.",
    "I can rearrange blocks according to the rules.",
]

# Goal (to format)
_GOAL = "Rearrange the blocks so that {goal_description}."

# Initial state descriptions (to format)
_INITIAL_STATES = {
    "on_table": "the {block} block is on the table",
    "on_top": "the block {above} is on top of the {below} block",
    "clear": "the block {block} is clear",
}


class SingleAgentBlocksworld(Environment):
    def __init__(
        self, num_blocks: int = 5, easy: bool = True, agent_name: str = "Agent"
    ):
        """
        Single-agent version of the blocks world problem.

        Args:
            num_blocks (int): Number of uniquely labeled blocks. Defaults to 5.
            easy (bool): If True, start with each block in its own stack.
        """
        super(SingleAgentBlocksworld, self).__init__(name="single-agent-blocksworld")
        if num_blocks < 2:
            raise ValueError("There must be at least 2 blocks.")
        self.agents_name = agent_name
        self.num_blocks = num_blocks
        self.easy = easy
        self.letters = [chr(ord("A") + i) for i in range(num_blocks)]

        self.public_information = _PUBLIC_INFO

        self.knowledge = {self.agents_name: _KNOWLEDGE}

        self.goal = ""
        self._blocks_init: List[str] = []
        self._blocks_goal: List[str] = []

        self.reset()

    def reset(self):
        """
        Initialize random starting and goal configurations.
        """

        def get_arrangement(bins: int, letters: List[str]) -> List[List[str]]:
            bases = random.sample(letters, bins)
            stacks = [[b] for b in bases]
            remaining = list(set(letters) - set(bases))
            while remaining:
                idx = random.choice(range(len(stacks)))
                stacks[idx].append(remaining.pop())
            return stacks

        def describe(stacks: List[List[str]]) -> str:
            facts = []
            for stack in stacks:
                facts.append(_INITIAL_STATES["on_table"].format(block=stack[0]))
                for below, above in zip(stack, stack[1:]):
                    facts.append(
                        _INITIAL_STATES["on_top"].format(above=above, below=below)
                    )
                facts.append(_INITIAL_STATES["clear"].format(block=stack[-1]))
            return ", ".join(facts[:-1]) + ", and " + facts[-1] + "."

        bins = self.num_blocks if self.easy else random.randint(1, self.num_blocks)
        init_stack = get_arrangement(bins, self.letters)
        goal_stack = init_stack
        while goal_stack == init_stack:
            goal_stack = get_arrangement(
                random.randint(1, self.num_blocks), self.letters
            )

        self._blocks_init = init_stack
        self._blocks_goal = goal_stack
        self.goal = _GOAL.format(goal_description=describe(goal_stack))
        self.public_information = _PUBLIC_INFO[-1].format(
            initial_conditions=describe(init_stack)
        )

    def render(self, config: str = "init"):
        if config == "init":
            stacks = self._blocks_init
        elif config == "goal":
            stacks = self._blocks_goal
        else:
            raise ValueError("config must be 'init' or 'goal'.")

        sep = "    "
        max_h = max(len(s) for s in stacks)
        rows = [
            sep.join([stack[h] if len(stack) > h else " " for stack in stacks])
            for h in range(max_h)
        ]
        print("\n".join(rows[::-1]))
