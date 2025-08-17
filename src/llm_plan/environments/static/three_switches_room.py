import itertools
import random
from typing import List

from src.llm_plan.environment import Environment


class ThreeSwitchesRoom(Environment):
    def __init__(self, grid_size: int = 4, visibility: List[int] | int = 1):
        """
        A 4x4 grid with three agents (R, G, B), three corresponding switches, and a locked door.
        The door opens only if all three agents are on their respective switches at the same time.

        Args:
            grid_size (int): Size of the grid. Defaults to 4.
            visibility (List[int] | int): Vision radius per agent. Defaults to 1 (can see adjacent cells including diagonals).
        """
        super(ThreeSwitchesRoom, self).__init__()
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
        print("Goal: All three switches pressed at the same time to unlock the door.")

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
