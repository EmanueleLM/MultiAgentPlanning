import itertools
import random
from abc import ABC, abstractmethod
from typing import List


class StaticEnviroment(ABC):
    """
    Abstract base class for static environments.
    Classes that extend StaticEnvironment should encompass only cases where:
    - the environment does not change;
    - the agents cannot explore.
    """

    @abstractmethod
    def render(self):
        """
        Render the current state of the environment.
        """
        pass

    @abstractmethod
    def reset(self):
        """
        Reset the environment.
        """
        pass


class StaticAgentsVault(StaticEnviroment):
    def __init__(self, grid_size: int = 4, visibility: List[int] | int = [1, 1]):
        """A grid where two agents (Agent A and Agent B) are places randomly on the border, with a 'vault' in the middle.
        Agents cannot move: they have to provide a plan given the current observations they have of the environemnt.

        Args:
            grid_size (int, optional): Size of the grid: each agent occupies one cell. Defaults to 4.
            visibility (List[int], optional): The number of cells around an agent they can see. Defaults to [1, 1]. Diagonals included.

        Please notice that in this problem, the position of the agents and the vault are only used to compute the visibilty.
        The actions we expect the agents come up with are reach_the_vault and not move_up, move_down, etc.
        """
        super(StaticAgentsVault, self).__init__()
        self.grid_size = grid_size
        self.visibility = (
            [visibility, visibility] if isinstance(visibility, int) else visibility
        )

        # Public information available to anyone in the environment
        self.public_information = [
            "There is a vault in the environment.",
            "The vault is closed.",
            "The vault requires a key to be opened.",
            "The entrance of the vault is small.",
        ]

        # What the agents see and know
        self.knowledge = {
            "Agent A": [
                "I have the key to open the vault.",
                "I am a big robot. I cannot enter the vault to grab the object, even if it is open.",
                "There may be another collaborative agent in the environment.",
            ],
            "Agent B": [
                "I do not have the key to open the vault.",
                "I am a small robot. If the vault is open, I can enter and grab the object.",
                "There may be another collaborative agent in the environment.",
            ],
        }

        # What another agent observe if they can see one of the objects in the dictionary
        self.observables = {
            "Agent A": [
                "Agent A has the key to open the vault.",
                "Agent A cannot enter the vault to grab the object.",
            ],
            "Agent B": ["Agent B can enter the vault to grab the object."],
        }

        # The overall goal
        self.goal = {
            "Agent A": "Open the vault and grab the object inside.",
            "Agent B": "Open the vault and grab the object inside.",
        }

        self.reset()  # Call reset to initialize the environment

    def reset(self):
        """
        Randomly re-initialize the environment.
        """
        # Sample three unique positions for the two agents and the vault
        _grid_range = range(self.grid_size)
        _all_positions = list(
            itertools.product(_grid_range, _grid_range)
        )  # Generate all possible unique positions on the grid
        _positions = random.sample(_all_positions, 3)  # Sample without replacement
        self.positions = {
            "Agent A": _positions[0],
            "Agent B": _positions[1],
            "Vault": _positions[2],
        }

        # Re-initialize knowledge based on visibility
        # Reset knowledge to its base state before adding observables
        self.knowledge = {
            "Agent A": [
                "I am a big robot.",
                "The vault is closed.",
                "I have the key to open the vault.",
                "I cannot grab the object inside the vault.",
            ],
            "Agent B": [
                "I am a small robot",
                "The vault is closed.",
                "I do not have the key to open the vault.",
                "If the vault is open, I can enter and grab the object.",
            ],
        }

        def x_sees_y(x_pos: List[int], y_pos: List[int], r: float) -> bool:
            """
            Checks if agent at x_pos can see object at y_pos within a given radius r.
            This correctly uses absolute differences for both x and y coordinates.
            """
            return abs(x_pos[0] - y_pos[0]) <= r and abs(x_pos[1] - y_pos[1]) <= r

        self.a_sees_b = x_sees_y(
            self.positions["Agent A"], self.positions["Agent B"], self.visibility[0]
        )
        self.b_sees_a = x_sees_y(
            self.positions["Agent B"], self.positions["Agent A"], self.visibility[1]
        )

        if self.a_sees_b:
            # Agent A observes Agent B, so add Agent B's observables
            self.knowledge["Agent A"].extend(self.observables["Agent B"])

        if self.b_sees_a:
            # Agent B observes Agent A, so add Agent A's observables
            self.knowledge["Agent B"].extend(self.observables["Agent A"])

    def render(self):
        """
        Renders the current state of the environment.
        """
        print("--- Static Agents Vault Environment ---")
        print(f"Goal: {self.goal}")

        print("\n--- Positions ---")
        for entity, pos in self.positions.items():
            print(f"{entity}: {pos}")
        print(f"Agent A sees B: {self.a_sees_b}")
        print(f"Agent A sees B: {self.b_sees_a}")

        print("\n--- Knowledge of Agents ---")
        for agent, knowledge in self.knowledge.items():
            print(f"{agent}:")
            for item in knowledge:
                print(f"  - {item}")

        print("\n--- Public Information ---")
        for info in self.public_information:
            print(f" - {info}")

        grid = []
        for y in range(self.grid_size):
            row = []
            for x in range(self.grid_size):
                row.append(".")  # Initialize each cell with a blank character
            grid.append(row)

        # Place the agents and the vault on the grid
        for entity, pos in self.positions.items():
            x, y = pos
            if entity == "Agent A":
                grid[y][x] = "A"
            elif entity == "Agent B":
                grid[y][x] = "B"
            elif entity == "Vault":
                grid[y][x] = "V"

        # Print the grid
        print("\n--- Grid ---")
        for row in grid:
            print(" ".join(row))
        print("--- Legend ---")
        print("--- A: Agent A, B: Agent B, V: Vault ---")
        print("-------------------------------------")


class StaticBlocksworld(StaticEnviroment):
    def __init__(self, num_vowels: int = 3, num_consonants: int = 3, easy: bool = True):
        super().__init__()
        """Two body-less agents A and B are in an environment with blocks labelled by letters. Agent A can only move vowel blocks
        and agent B can only move consonant blocks. The goal is to rearrange and restack blocks from one configuration to another.

        Args:
            num_vowels (int, optional): Number of vowel blocks in the environment. Defualts to 3.
            num_consonants (int, optional): Number of consonant blocks in the environment. Defaults to 3.
            easy (bool, optional): Whether easy mode is enabled. When easy mode is enabled, instances start with each block
            occupying their own stack, i.e. there are the same number of blocks as stacks, and no unstacking will be required. Defaults
            to True. If disabled, will start with a random stacked arrangement.
        """
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
