import copy
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


class StaticTwoAgentsBlocksworld(StaticEnviroment):
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


class StaticThreeSwitchesRoom(StaticEnviroment):
    def __init__(self, grid_size: int = 4, visibility: List[int] | int = 1):
        """
        A 4x4 grid with three agents (R, G, B), three corresponding switches, and a locked door.
        The door opens only if all three agents are on their respective switches at the same time.

        Args:
            grid_size (int): Size of the grid. Defaults to 4.
            visibility (List[int] | int): Vision radius per agent. Defaults to 1 (can see adjacent cells including diagonals).
        """
        super().__init__()
        self.grid_size = grid_size
        self.visibility = (
            [visibility] * 3 if isinstance(visibility, int) else visibility
        )

        # Public facts
        self.public_information = [
            "There is a locked door in the room.",
            "There are three pressure-sensitive switches: red, green, and blue.",
            "The door will open only if all three switches are pressed simultaneously.",
        ]

        # Knowledge per agent
        self.knowledge = {
            "Agent R": [
                "I am Agent R (Red).",
                "My objective is to press the red switch.",
                "I can move Up, Down, Left, Right, or Stay.",
            ],
            "Agent G": [
                "I am Agent G (Green).",
                "My objective is to press the green switch.",
                "I can move Up, Down, Left, Right, or Stay.",
            ],
            "Agent B": [
                "I am Agent B (Blue).",
                "My objective is to press the blue switch.",
                "I can move Up, Down, Left, Right, or Stay.",
            ],
        }

        # Observable info
        self.observables = {
            "Agent R": ["Agent R can move towards and press the red switch."],
            "Agent G": ["Agent G can move towards and press the green switch."],
            "Agent B": ["Agent B can move towards and press the blue switch."],
        }

        # Goal
        self.goal = {
            "Agent R": "Coordinate with Agents G and B so that all switches are pressed at the same time to unlock the door.",
            "Agent G": "Coordinate with Agents R and B so that all switches are pressed at the same time to unlock the door.",
            "Agent B": "Coordinate with Agents R and G so that all switches are pressed at the same time to unlock the door.",
        }

        self.reset()

    def reset(self):
        """
        Randomly place agents, switches, and door in the grid.
        """
        positions = list(
            itertools.product(range(self.grid_size), range(self.grid_size))
        )
        chosen_positions = random.sample(positions, 7)  # 3 agents, 3 switches, 1 door

        self.positions = {
            "Agent R": chosen_positions[0],
            "Agent G": chosen_positions[1],
            "Agent B": chosen_positions[2],
            "Red Switch": chosen_positions[3],
            "Green Switch": chosen_positions[4],
            "Blue Switch": chosen_positions[5],
            "Door": chosen_positions[6],
        }

        def can_see(agent_pos, object_pos, r):
            return (
                abs(agent_pos[0] - object_pos[0]) <= r
                and abs(agent_pos[1] - object_pos[1]) <= r
            )

        # Reset visibility-based knowledge
        for agent in ["Agent R", "Agent G", "Agent B"]:
            base_knowledge = [
                f"I am {agent}.",
                f"My target is the {agent.split()[1].lower()} switch.",
                "I can move Up, Down, Left, Right, or Stay.",
            ]
            self.knowledge[agent] = base_knowledge.copy()

            # Add visible objects
            for obj in ["Red Switch", "Green Switch", "Blue Switch", "Door"]:
                if can_see(
                    self.positions[agent], self.positions[obj], self.visibility[0]
                ):
                    self.knowledge[agent].append(
                        f"I can see the {obj} at position {self.positions[obj]}."
                    )

    def render(self):
        """
        Display the environment grid.
        """
        print("--- Three Switches Room ---")
        print(f"Goal: All three switches pressed at the same time to unlock the door.")

        print("\n--- Positions ---")
        for entity, pos in self.positions.items():
            print(f"{entity}: {pos}")

        print("\n--- Knowledge ---")
        for agent, facts in self.knowledge.items():
            print(f"{agent}:")
            for fact in facts:
                print(f"  - {fact}")

        print("\n--- Public Information ---")
        for info in self.public_information:
            print(f" - {info}")

        grid = [["." for _ in range(self.grid_size)] for _ in range(self.grid_size)]

        symbols = {
            "Agent R": "R",
            "Agent G": "G",
            "Agent B": "B",
            "Red Switch": "r",
            "Green Switch": "g",
            "Blue Switch": "b",
            "Door": "D",
        }

        for entity, (x, y) in self.positions.items():
            grid[y][x] = symbols[entity]

        print("\n--- Grid ---")
        for row in grid:
            print(" ".join(row))
        print("--- Legend ---")
        print("R/G/B: Agents | r/g/b: Switches | D: Door")


class StaticSingleAgentBlocksworld(StaticEnviroment):
    def __init__(self, num_blocks: int = 5, easy: bool = True):
        """
        Single-agent version of the blocks world problem.

        Args:
            num_blocks (int): Number of uniquely labeled blocks. Defaults to 5.
            easy (bool): If True, start with each block in its own stack.
        """
        super().__init__()
        if num_blocks < 2:
            raise ValueError("There must be at least 2 blocks.")
        self.num_blocks = num_blocks
        self.easy = easy
        self.letters = [chr(ord("A") + i) for i in range(num_blocks)]

        self.public_information = [
            "I can move blocks between stacks.",
            "I can only move one block at a time.",
            "I can only move a block if there is no other block on top of it (the block is clear).",
            "Once I move a block, I can place it either on the table (start a new stack) or on top of another clear block.",
        ]

        self.knowledge = {
            "Agent": [
                "I am the only agent in this environment.",
                "I can rearrange blocks according to the rules.",
            ]
        }

        self.observables = {"Agent": ["This agent can move any block that is clear."]}

        self.goal = {"Agent": ""}
        self._blocks_init = []
        self._blocks_goal = []

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
                facts.append(f"the {stack[0]} block is on the table")
                for below, above in zip(stack, stack[1:]):
                    facts.append(f"the block {above} is on top of the {below} block")
                facts.append(f"the block {stack[-1]} is clear")
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
        self.goal["Agent"] = f"Rearrange the blocks so that {describe(goal_stack)}"
        self.public_information.append(f"As initial conditions: {describe(init_stack)}")

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


class StaticPackageDelivery(StaticEnviroment):
    """
    A single-agent, static environment where a truck must deliver a package
    from a post office to a house. The environment itself does not change,
    but it presents a planning problem to the agent.
    """

    def __init__(self):
        """
        Initializes the Package Delivery environment.
        """
        super().__init__()
        self.locations = ["post-office", "house"]

        # Public information available to the agent
        self.public_information = [
            "A single package, initially at a post office, needs to be transported to a house using one truck.",
            "The truck can move between the post office and the house.",
        ]

        # Base knowledge for the agent, not including the initial state
        self._base_knowledge = {
            "Agent": [
                "I am the truck driver.",
                "To load the package, the truck must be at the same location as the package.",
                "To unload the package, it must first be inside the truck.",
                "The package cannot move on its own; it must be transported by the truck.",
            ]
        }

        # The agent's specific knowledge will be fully populated by reset()
        self.knowledge = {}

        # The final goal of the problem
        self.goal = {"Agent": "The package must be delivered to the house."}

        # The state of the environment, initialized by reset()
        self.state = {}

        self.reset()  # Initialize the environment to its starting state

    def reset(self):
        """
        Resets the environment to its initial state.
        The truck and the package are at the post office.
        """
        self.state = {
            "truck_at": "post-office",
            "package_at": "post-office",
            "in_truck": False,
        }

        # Create a fresh copy of knowledge and add the initial state information
        self.knowledge = copy.deepcopy(self._base_knowledge)
        initial_state_info = [
            f"The truck is currently at the {self.state['truck_at']}.",
            f"The package is currently at the {self.state['package_at']}.",
        ]
        self.knowledge["Agent"].extend(initial_state_info)

    def render(self):
        """
        Renders a text-based representation of the environment's current state.
        """
        print("--- Package Delivery Environment ---")
        print(f"Goal: {self.goal['Agent']}")

        print("\n--- Current State ---")
        truck_loc = self.state["truck_at"]
        pkg_loc = self.state["package_at"]
        in_truck = self.state["in_truck"]

        print(f"Truck Location: {truck_loc}")
        print(f"Package Location: {'Inside Truck' if in_truck else pkg_loc}")

        # Visual representation
        po_occupants = []
        house_occupants = []

        if truck_loc == "post-office":
            po_occupants.append("T(P)" if in_truck else "T")
        elif truck_loc == "house":
            house_occupants.append("T(P)" if in_truck else "T")

        if not in_truck:
            if pkg_loc == "post-office":
                po_occupants.append("P")
            elif pkg_loc == "house":
                house_occupants.append("P")

        print("\n--- Visual ---")
        print(
            f"[Post Office] {' '.join(sorted(po_occupants)):<5} <---> [House] {' '.join(sorted(house_occupants)):<5}"
        )
        print("T: Truck, P: Package, T(P): Package in Truck")
        print("------------------------------------")
