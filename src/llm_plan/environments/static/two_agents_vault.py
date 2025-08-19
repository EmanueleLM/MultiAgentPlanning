from typing import List, Tuple

from src.llm_plan.environment import Environment


class TwoAgentsVault(Environment):
    """
    A grid environment where two collaborative agents must open a vault.

    This class sets up a scenario with two agents and a vault at random
    positions. The agents have distinct capabilities and partial visibility
    of each other. The environment is designed to test an AI's ability to
    formulate a collaborative plan based on initial knowledge and observations.

    Attributes:
        grid_size (int): The side length of the square grid.
        positions (Dict[str, Tuple[int, int]]): The (x, y) coordinates of each entity.
    """

    def __init__(self, config: str):
        """Initalize the environment from a JSON configuration file.

        Args:
            config (str): path to the JSON configuration file for the environment.
        """
        super().__init__(config)
        self.reset()

    def reset(self, config: str | None = None):
        """
        This method creates the graph of the constraints and sets up the prompts
        """
        if config:
            super().__init__(
                config
            )  # This is for reloading the environment with a new config

        # Map additional fields that are not defined in the abstract Environment class
        # 1. Envrionment-specific constants
        self.grid_size = self.environment.get("init").get("grid_size", 4)
        self.visibility = self.environment.get("init").get("visibility", 1)

        # 2. Agents information
        self.agent_names = self.agents.get("names")

        # 3. Orchestrator information
        if "orchestrator" in self.config_data:
            self.orchestrator_name = self.config_data.get("orchestrator").get(
                "name", "Orchestrator"
            )

        # Workflow information
        # 1. Agents actions
        self.actions = {}
        for agent in self.agent_names:
            self.actions[agent] = self.workflow.get(agent)

        # 2. Orchestrator actions
        self.actions[self.orchestrator_name] = self.workflow.get(
            self.orchestrator_name, {}
        )

        # 3. Collect actions and constraints
        actions = []
        for agent, config in self.workflow.items():
            if agent == "constraints":
                continue
            actions.extend(
                ["{}.{}".format(agent, a) for a in self.workflow.get(agent, {}).keys()]
            )

        self.workflow_constraints: List[str] = self.workflow.get("constraints", [])

        # 4. Build the dependency graph between tasks
        self.plan = self.schedule(actions, self.workflow_constraints)

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
        pass
