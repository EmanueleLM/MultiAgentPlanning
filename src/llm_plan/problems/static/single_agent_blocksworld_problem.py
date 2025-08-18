import textwrap

from src.llm_plan.environments.static.single_agent_blocksworld import (
    SingleAgentBlocksworld,
)
from src.llm_plan.problem import Problem

# Separate data from logic
_SYSTEM_PROMPT = textwrap.dedent("""You are an expert with PDDL problems (Planning Domain Definition Language). 
            You always provide a PDDL domain and a PDDL problem file to solve the task. 
            You always enclose the pddl domain between <domain></domain> tags, and the pddl problem between <problem></problem> tags.
            """).strip()

_PROMPT_TEMPLATE = textwrap.dedent("""You are the only agent in an environment with the following public information:
                                {public_information}
                                
                                You have the following knowledge:
                                {agent_knowledge}
                                
                                This is the global goal to solve:
                                {goal}
                                
                                Think step by step and provide a PDDL domain and a PDDL problem file to solve the task.
                                If you miss some information, do not make assumptions—just give a plan that concerns the information you have.
                                Enclose the pddl domain between <domain></domain> tags, and the pddl problem between <problem></problem> tags.
                                """).strip()


class ProblemStaticSingleAgentBlocksworld(Problem):
    def __init__(self, **kwargs):
        super().__init__()
        super(SingleAgentBlocksworld, self).__init__(name="single-agent-blocksworld")
        self.environment = SingleAgentBlocksworld(
            **kwargs
        )  # Initialize the environment with any additional kwargs

        self.agent_knowledge = self.format_info(
            self.env.knowledge[self.environment.agent_name]
        )
        self.public_information = self.format_info(self.env.public_information)
        self.agent_goal = self.format_info(self.env.goal[self.environment.agent_name])

        self.prompt = _PROMPT_TEMPLATE.format(
            public_information=self.public_information,
            agent_knowledge=self.agent_knowledge,
            goal=self.agent_goal,
        )

        self.system_prompts = {self.environment.agent_name: _SYSTEM_PROMPT}
        self.prompts = {self.environment.agent_name: self.prompt}
