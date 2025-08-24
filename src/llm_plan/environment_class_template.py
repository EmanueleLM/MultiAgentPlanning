from typing import List
from src.llm_plan.environment import Environment


class Problem(Environment):
    """
    Description of the problem environment.
    """

    def __init__(self, config: str):
        """Initialize the environment from a JSON configuration file."""
        super().__init__(config)
        self.reset()

    def reset(self, config: str | None = None):
        """Set up environment, agents, orchestrator, workflow, and plan."""
        if config:
            super().__init__(config)  # reload environment with new config

        # TODO: Environment setup: complete this section based on how the environment is defined in the JSON config
        # YOUR CODE HERE

        # Agents
        self.agent_names = self.agents.get("names", [])

        # Orchestrator
        self.orchestrator_name = self.config_data.get("orchestrator", {}).get(
            "name", "Orchestrator"
        )

        # Workflow actions
        self.actions = {}
        for agent in self.agent_names:
            self.actions[agent] = self.workflow.get(agent, {})

        self.actions[self.orchestrator_name] = self.workflow.get(
            self.orchestrator_name, {}
        )

        # Workflow steps
        actions = []
        for agent, cfg in self.workflow.items():
            if agent == "constraints":
                continue
            actions.extend(
                ["{}.{}".format(agent, a) for a in self.workflow.get(agent, {}).keys()]
            )

        # Constraints
        self.workflow_constraints: List[str] = self.workflow.get("constraints", [])

        # Build schedule dependency graph
        self.plan = self.schedule(actions, self.workflow_constraints)

    def render(self):
        """Prints a human-readable representation of the environment."""
        # TODO: Implement the render method
        # YOUR CODE HERE
        pass
