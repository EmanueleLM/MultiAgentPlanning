import copy
import itertools
import random
from typing import List, Tuple, Dict

from src.llm_plan.environment import Environment

# Separate data from logic
_PUBLIC_INFO = [
    "There is a vault in the environment.",
    "The vault is closed.",
    "The vault requires a key to be opened.",
    "The entrance of the vault is small.",
]

# Define agent properties in a structured way for easy modification.
_AGENT_PROPERTIES = {
    "key_holder": {
        "description": "I am a big robot.",
        "capabilities": [
            "I have the key to open the vault.",
            "I cannot enter the vault to grab the object, even if it is open.",
        ],
        "observables": [
            "has the key to open the vault.",
            "cannot enter the vault to grab the object.",
        ],
    },
    "small_robot": {
        "description": "I am a small robot.",
        "capabilities": [
            "I do not have the key to open the vault.",
            "If the vault is open, I can enter and grab the object.",
        ],
        "observables": ["can enter the vault to grab the object."],
    },
}

_VAULT_NAME = "Vault"
_GOAL = "Open the vault and grab the object inside."


class TwoAgentsVault(Environment):
    """
    A grid environment where two collaborative agents must open a vault.

    This class sets up a scenario with two agents and a vault at random
    positions. The agents have distinct capabilities and partial visibility
    of each other. The environment is designed to test an AI's ability to
    formulate a collaborative plan based on initial knowledge and observations.

    Attributes:
        grid_size (int): The side length of the square grid.
        agent_names (Tuple[str, str]): The names of the two agents.
        positions (Dict[str, Tuple[int, int]]): The (x, y) coordinates of each entity.
        knowledge (Dict[str, List[str]]): The information known by each agent.
        public_information (List[str]): Information available to all.
        goal (str): The shared goal for the agents.
    """

    def __init__(
        self,
        grid_size: int = 4,
        visibility: int | List[int] = 1,
        agent_names: Tuple[str, str] = ("Agent A", "Agent B"),
        orchestrator_name: str = "Orchestrator",
    ):
        """
        Initializes the TwoAgentsVault environment.

        Args:
            grid_size (int): The size of the grid (e.g., 4 for a 4x4 grid).
            visibility (int | List[int]): The visibility radius for the agents.
                                          If an int, it's applied to both.
                                          If a list, specifies radius for each agent.
            agent_names (Tuple[str, str]): The names for the two agents.
        """
        super().__init__(name="two-agents-vault")
        self.grid_size = grid_size
        self.agent_names = agent_names
        self.orchestrator_name = orchestrator_name
        self.visibility = (
            [visibility, visibility] if isinstance(visibility, int) else visibility
        )
        self.public_information = _PUBLIC_INFO
        self.goal = _GOAL

        # The entities that need positions on the grid.
        self._entities = list(self.agent_names) + [_VAULT_NAME]

        # Dynamically build base knowledge and observables from constants.
        # This makes the class more flexible and avoids hardcoding.
        self._base_knowledge, self._observables = self._initialize_agent_properties()

        # State variables, initialized to be empty before reset() is called.
        self.positions: Dict[str, Tuple[int, int]] = {}
        self.knowledge: Dict[str, List[str]] = {}
        self.visibility_map: Dict[Tuple[str, str], bool] = {}

        self.reset()

    def _initialize_agent_properties(
        self,
    ) -> Tuple[Dict[str, List[str]], Dict[str, List[str]]]:
        """Builds the base knowledge and observable statements for the agents."""
        agent1, agent2 = self.agent_names
        props1 = _AGENT_PROPERTIES["key_holder"]
        props2 = _AGENT_PROPERTIES["small_robot"]

        base_knowledge = {
            agent1: [props1["description"]] + props1["capabilities"],
            agent2: [props2["description"]] + props2["capabilities"],
        }
        # Add universal knowledge for all agents
        for agent in self.agent_names:
            base_knowledge[agent].append("There may be another collaborative agent.")

        observables = {
            agent1: [f"{agent1} {obs}" for obs in props1["observables"]],
            agent2: [f"{agent2} {obs}" for obs in props2["observables"]],
        }
        return base_knowledge, observables

    def reset(self):
        """
        Resets the environment to a new random state.

        This method re-samples positions for all entities and recalculates
        what each agent can see based on these new positions.
        """
        # --- 1. Reset Positions ---
        all_positions = list(itertools.product(range(self.grid_size), repeat=2))
        sampled_pos = random.sample(all_positions, len(self._entities))
        self.positions = dict(zip(self._entities, sampled_pos))

        # --- 2. Reset Knowledge and Visibility ---
        # Deepcopy ensures that modifications don't affect the base template.
        self.knowledge = copy.deepcopy(self._base_knowledge)
        self.visibility_map = {}

        # Determine visibility between each pair of agents.
        agent1, agent2 = self.agent_names
        vis1, vis2 = self.visibility

        sees_other = self._check_visibility(
            self.positions[agent1], self.positions[agent2], vis1
        )
        self.visibility_map[(agent1, agent2)] = sees_other
        if sees_other:
            self.knowledge[agent1].extend(self._observables[agent2])

        other_sees_me = self._check_visibility(
            self.positions[agent2], self.positions[agent1], vis2
        )
        self.visibility_map[(agent2, agent1)] = other_sees_me
        if other_sees_me:
            self.knowledge[agent2].extend(self._observables[agent1])

    @staticmethod
    def _check_visibility(
        pos1: Tuple[int, int], pos2: Tuple[int, int], radius: int
    ) -> bool:
        """
        Checks if an entity at pos1 can see an entity at pos2.

        Visibility is based on the Chebyshev distance (maximum coordinate difference),
        which creates a square-shaped field of view.

        Args:
            pos1 (Tuple[int, int]): The (x, y) position of the observer.
            pos2 (Tuple[int, int]): The (x, y) position of the target.
            radius (int): The visibility radius.

        Returns:
            bool: True if pos2 is within the visibility radius of pos1.
        """
        dx = abs(pos1[0] - pos2[0])
        dy = abs(pos1[1] - pos2[1])
        return dx <= radius and dy <= radius

    def render(self):
        """
        Prints a human-readable representation of the environment's current state.
        """
        print("--- Two Agents Vault Environment ---")
        print(f"Goal: {self.goal}\n")

        print("--- Public Information ---")
        for info in self.public_information:
            print(f"- {info}")

        print("\n--- Current State ---")
        for entity, pos in self.positions.items():
            print(f"- {entity} is at position {pos}")

        agent1, agent2 = self.agent_names
        print(
            f"- {agent1} sees {agent2}: {self.visibility_map.get((agent1, agent2), False)}"
        )
        print(
            f"- {agent2} sees {agent1}: {self.visibility_map.get((agent2, agent1), False)}"
        )

        print("\n--- Agent Knowledge ---")
        for agent, knowledge_list in self.knowledge.items():
            print(f"🧠 {agent}:")
            for item in knowledge_list:
                print(f"  - {item}")

        # --- Grid Visualization ---
        grid = [["." for _ in range(self.grid_size)] for _ in range(self.grid_size)]

        # Use first letter as symbol, or 'V' for vault.
        entity_symbols = {
            self.agent_names[0]: "A",
            self.agent_names[1]: "B",
            _VAULT_NAME: "V",
        }

        for entity, pos in self.positions.items():
            x, y = pos
            grid[y][x] = entity_symbols.get(entity, "?")

        print("\n--- Grid ---")
        for row in grid:
            print(" ".join(row))
        print("Legend: A: Agent A, B: Agent B, V: Vault")
        print("-------------------------------------\n")
