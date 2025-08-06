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
    def __init__(self, grid_size: int = 4, visibility: List[int] = [1, 1]):
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
        self.visibility = visibility

        # The dictionary to keep track of each agent
        self.agents = {"Agent A": None, "Agent B": None}

        # Public information available to anyone in the environment
        self.public_information = [
            "There is a vault in the environment.",
            "The vault is closed.",
            "The vault requires a key to be opened.",
            "The entrance of the vault is small.",
            "There may be another collaborative agent in the environment.",
        ]

        # What the agents see and know
        self.knowledge = {
            "Agent A": [
                "I have the key to open the vault.",
                "I am a big robot. I cannot enter the vault to grab the object, even if it is open.",
            ],
            "Agent B": [
                "I do not have the key to open the vault.",
                "I am a small robot. If the vault is open, I can enter and grab the object.",
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
        self.goal = "Open the vault and grab the object inside."

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

        def x_sees_y(x_pos, y_pos, r):
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
