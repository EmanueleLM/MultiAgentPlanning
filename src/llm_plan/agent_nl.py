import inspect
from llm_plan.agent import Agent
from langchain.chat_models import ChatOpenAI
from langchain_core.messages import HumanMessage, SystemMessage


class AgentNaturalLanguage(Agent):
    required_args = {
        "specification": "(str) The plan to be checked for improvement.",
        "pddl_domain": "(str) The PDDL domain that describes the specification.",
        "pddl_problem": "(str) The PDDL problem that instantiates the specification.",
        "pddl_plan": "(str) The PDDL plan.",
    }  # Static!

    def __init__(self, llm: ChatOpenAI, prompt_args: dict[str, str]):
        """
        Initialize the Agent that eventually turns the final plan into natural actions.

        Input:
            llm (ChatOpenAI): The language model to use for fixing the syntax.
        """
        super().__init__(prompt_args=prompt_args)
        self.name = "AgentNaturalLanguage"
        self.llm = llm

        # Prompts
        self.system_prompt = inspect.cleandoc(
            """\
                                             You are an agent that translates PDDL into natural language. 
                                             Your task is to turn a specific in JSON, a PDDL problem, a PDDL domain, and a PDDL plan, into a set of actions that is readable by humans. 
                                             You follow closely the plan provided within <plan></plan> tags. 
                                             You can think as much as you want before answering, and you can use as many steps as you want.
                                             """
        )
        self.prompt = inspect.cleandoc(
            """\
                                      Given this specification, in JSON format:
                                      <specification>{specification}</specification>
                                      
                                      And this PDDL domain that describes the specification:
                                      <domain>{pddl_domain}</domain>
                                      
                                      And this PDDL problem that instatiates the specification:
                                      <problem>{pddl_problem}</problem>
                                      
                                      This is the PDDL plan that correctly solves the task:
                                      <plan>{pddl_plan}</plan>
                                      
                                      Your task is to output a set of actions that is readable by humans and that satisfies the final goal.
                                      Remember that your output:
                                      - Must match closely each action in the plan. Do not add more or delete any.
                                      - Must report each step clearly.
                                      - Whenever possible, each step should report the time duration and/or the timestamp.
                                      - Your plan must be compliant with the specification.
                                      """
        )

    def run(self) -> str:
        """
        Run the Agent to solve hallucinations in the plan.

        Input:
            src (str): The plan to be fixed for hallucinations.

        Output:
            str: The fixed plan.
        """
        self.upload_args(self.prompt_args)  # ensure args are uploaded

        # Fix the plan
        prompt = self.prompt.format(
            specification=self.prompt_args["specification"],
            pddl_domain=self.prompt_args["pddl_domain"],
            pddl_problem=self.prompt_args["pddl_problem"],
            pddl_plan=self.prompt_args["pddl_plan"],
        )
        inp = [SystemMessage(content=self.system_prompt), HumanMessage(content=prompt)]
        return self.llm.invoke(inp).content
