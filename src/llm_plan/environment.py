import json
from collections import defaultdict, deque
from typing import List


class Environment:
    """
    Abstract base class for static environments.
    """

    def __init__(self, config: str):
        """
        Initialize the environment with a json configuration file.

        Args:
            config (str): Path to the json configuration string for the environment.
        """
        with open(config, "r") as f:
            self.config_data = json.load(f)

        self.name = self.config_data.get("name", "UnnamedEnvironment")
        self.agents = self.config_data.get("agents")
        self.orchestrator = self.config_data.get("orchestrator", None)
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
        # 1. Agents actions
        self.actions = {}
        for agent in self.agent_names:
            self.actions[agent] = self.workflow.get(agent)

        # 2. Collect actions and constraints
        actions = []
        for agent, config in self.workflow.items():
            if agent == "constraints":  # TODO: reformat workflow to avoid this
                continue
            actions.extend(
                [f"{agent}.{a}" for a in self.workflow.get(agent, {}).keys()]
            )
        
        # Get the constraints
        self.workflow_constraints: List[str] = self.workflow.get("constraints", [])
        
        # If no constraints are found, try to find them at the upper level of the schema
        # TODO: enforce constraints in workflow via json-schema
        if self.workflow_constraints == []:
            self.workflow_constraints = self.config_data.get("constraints", [])

        # 4. Build the dependency graph between tasks
        self.plan = self.schedule(actions, self.workflow_constraints)

    @staticmethod
    def schedule(actions: List[str], constraints: List[str]) -> List[List[str]]:
        """_summary_

        Args:
            actions (List[str]): _description_
            constraints (List[str]): _description_

        Raises:
            ValueError: _description_
            ValueError: _description_

        Returns:
            List[List[str]]: _description_
        """
        # helper: normalize names (strip whitespace, remove BOM)
        def norm(s: str) -> str:
            return s.strip().lstrip("\ufeff")

        # parse constraints, normalizing and collecting nodes
        edges = []
        nodes = set(norm(a) for a in actions)
        for c in constraints:
            if "->" not in c:
                raise ValueError(f"Bad constraint (missing '->'): {c!r}")
            src, dst = c.split("->", 1)
            src, dst = norm(src), norm(dst)
            edges.append((src, dst))
            nodes.add(src); nodes.add(dst)

        # build graph + indegree
        graph = defaultdict(list)
        indegree = {n: 0 for n in nodes}
        for src, dst in edges:
            graph[src].append(dst)
            indegree[dst] += 1

        # order map so we can keep actions in original order within each level
        order = {norm(a): i for i, a in enumerate(actions)}

        # Kahn's algorithm collecting levels
        result = []
        queue = deque([n for n in nodes if indegree[n] == 0])

        while queue:
            level_size = len(queue)
            level = []
            for _ in range(level_size):
                node = queue.popleft()
                level.append(node)
                for nei in graph[node]:
                    indegree[nei] -= 1
                    if indegree[nei] == 0:
                        queue.append(nei)
            # sort this level to match original actions order where possible
            level.sort(key=lambda x: order.get(x, 10**9))
            result.append(level)

        if any(indegree[n] > 0 for n in nodes):
            raise ValueError("Cycle detected in constraints!")

        return result
