import json
from collections import defaultdict, deque
from typing import List, Any, Dict


class Environment:
    """
    Abstract base class for static environments.
    """

    def __init__(self, config: str | Dict[str, Any]):
        """
        Initialize the environment with a json configuration file/dictionary object.

        Args:
            config (str | dict): Dict, or str path to the json configuration string for the environment.
        """
        if isinstance(config, str):
            with open(config, "r") as f:
                self.config_data = json.load(f)
        elif isinstance(config, dict):
            self.config_data = config
        else:
            raise ValueError("Invalid config type. Must be str or dict.")

        self.name = self.config_data.get("name", "UnnamedEnvironment")
        self.agents = self.config_data.get("agents")
        self.environment = self.config_data.get("environment")
        self.workflow = self.config_data.get("workflow")
        self.plan: List[List[str]]

        self.reset()

    def reset(self, **args):
        """
        This method creates the graph of the constraints and sets up the prompts
        """
        # Map additional fields that are not defined in the abstract Environment class
        # 1. Envrionment constants
        for arg in args:
            self.environment.get("init").get(arg)

        # 2. Agents information
        self.agent_names = self.agents.get("names")

        # Workflow information
        # Collect actions and constraints
        actions = []
        for agent, config in self.workflow["participants"].items():
            actions.append(f"{agent}.{config['task']}")

        self.workflow_constraints: List[str] = self.workflow.get(
            "order_constraints", []
        )

        # Build the dependency graph between tasks
        self.plan = self.schedule(actions, self.workflow_constraints)

    @staticmethod
    def schedule(actions: List[str], constraints: List[str]) -> List[List[str]]:
        # Collect all actions in a stable order
        ordered_actions: List[str] = []

        def add_action(a: str):
            a = a.strip()
            if a and a not in ordered_actions:
                ordered_actions.append(a)

        for a in actions:
            add_action(a)

        # Parse constraints and discover actions
        parsed_edges = []  # list of (src, dst)
        for c in constraints:
            c = c.strip()
            if not c:
                continue
            if "->" in c:
                src, dst = map(str.strip, c.split("->", 1))
                add_action(src)
                add_action(dst)
                parsed_edges.append((src, dst))
            else:
                add_action(c)  # singleton node

        graph = defaultdict(list)
        indegree = {a: 0 for a in ordered_actions}

        for src, dst in parsed_edges:
            graph[src].append(dst)
            indegree[dst] += 1

        for a in ordered_actions:
            graph.setdefault(a, [])

        # Kahn’s algorithm with level collection (stable order)
        queue = deque([a for a in ordered_actions if indegree[a] == 0])
        result: List[List[str]] = []

        while queue:
            layer_size = len(queue)
            level: List[str] = []
            for _ in range(layer_size):
                node = queue.popleft()
                level.append(node)  # <-- add once
                for nei in graph[node]:
                    indegree[nei] -= 1
                    if indegree[nei] == 0:
                        queue.append(nei)
            result.append(level)

        if any(indegree[a] > 0 for a in ordered_actions):
            raise ValueError("Cycle detected in order constraints!")

        return result
