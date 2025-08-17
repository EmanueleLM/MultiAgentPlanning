from src.llm_plan.problem import Problem
from src.llm_plan.environments.static.three_switches_room import ThreeSwitchesRoom


class StaticThreeSwitchesRoomProblem(Problem):
    def __init__(self, static_three_switches_room: ThreeSwitchesRoom):
        """
        Problem definition for the Three Switches Room environment.
        """
        super(StaticThreeSwitchesRoomProblem, self).__init__()
        self.system_prompts = {}
        self.prompts = {}

        self.system_prompt_template = (
            "You are an expert with PDDL problems (Planning Domain Definition Language). "
            "You always provide a PDDL domain and a PDDL problem file to solve the task."
        )

        self.prompt_template = (
            "You are {agent_name}. You are in an environment with the following public information:\n{public_information}\n"
            "You have the following knowledge:\n{agent_knowledge}\n"
            "This is the global goal to solve:\n{goal}\n"
            "Think step by step and provide a PDDL domain and a PDDL problem file to solve the task.\n"
            "If you miss some information, do not make assumptions—just give a plan that concerns the information you have."
        )

        self.orchestrator_prompt = (
            "There are three agents in an environment. You will receive their PDDL domains and problems.\n"
            "You need to orchestrate them to solve the task. Keep in mind that the PDDL they send you may be partial or contain ambiguities.\n"
            "The goal is for all three switches to be pressed simultaneously to unlock the door.\n"
            "A partial PDDL may partially solve a planning problem, but may require integrating additional information from other PDDLs.\n"
            "Ambiguities may appear, e.g., objects referred to with different names.\n"
            "Here's the information the first agent has and its PDDL response:\n"
            "{pddl_agent_R}\n"
            "Here's the information the second agent has and its PDDL response:\n"
            "{pddl_agent_G}\n"
            "Here's the information the third agent has and its PDDL response:\n"
            "{pddl_agent_B}\n"
            "You need to integrate the PDDL responses of the three agents to solve the task. The goal is: {goal}.\n"
            "Think step by step and provide a PDDL domain and a PDDL problem file to solve the task."
        )

        for agent_name in ["Agent R", "Agent G", "Agent B"]:
            self.system_prompts[agent_name] = self.system_prompt_template

            self.prompts[agent_name] = self.prompt_template.format(
                agent_name=agent_name,
                public_information=self.format_info(
                    static_three_switches_room.public_information
                ),
                agent_knowledge=self.format_info(
                    static_three_switches_room.knowledge[agent_name]
                ),
                goal=self.format_info(static_three_switches_room.goal[agent_name]),
            )

        self.system_prompts["Orchestrator"] = self.system_prompt_template
        self.prompts["Orchestrator"] = self.orchestrator_prompt
