import os
from dotenv import load_dotenv
from openai import OpenAI


class LLM:
    """
    A class representing a Language Model (LLM) that can generate problems (e.g., pddl) based on observations and prompts.
    """

    def __init__(self, model):
        """
        Initialize the LLM with a specific model.

        Args:
            model: The language model to be used for generating actions.
        """
        self.model_name = model

    def generate_sync(
        self,
        system_prompt: str,
        prompt: str,
    ) -> str:
        """
        Generate a reponse given a prompt.

        Args:
            system_prompt (str): The system prompt.
            prompt (str): The prompt.

        Returns:
            The answer of the model. None if there is an error.
        """
        # This method should be implemented by subclasses
        return "Subclasses should implement this method."


class GPT_Ollama(LLM):
    def __init__(self, reasoning: str | None = "High"):
        """
        Initialize the GPT_Ollama model.
        Instructions can be found here to init the model:
        https://cookbook.openai.com/articles/gpt-oss/run-locally-ollama

        Args:
            reasoning (str): The reasoning level for the model, default is "High". "Medium" and "Low" are also options.
            Keep in mind that the reasoning level is passed via the system prompt.
        """
        super().__init__("gpt-oss-20B-ollama")
        _url = "https://cookbook.openai.com/articles/gpt-oss/run-locally-ollama"
        self.reasoning = (
            "Reasoning: " + reasoning + "\n"
            if reasoning in ["High", "Medium", "Low"]
            else ""
        ).lower()

        try:
            self.client = OpenAI(
                base_url="http://localhost:11434/v1",
                api_key="ollama",
            )
        except Exception as e:
            print(f"Something went wrong with GPT-OSS-Ollama initialization.\n{e}")
            print(f"Check this url for how to setup GPT-OSS-Ollama locally: {_url}")

    def generate_sync(self, system_prompt: str, prompt: str) -> str:
        try:
            response = self.client.chat.completions.create(
                model="gpt-oss:20b",
                messages=[
                    {"role": "system", "content": f"{self.reasoning}{system_prompt}"},
                    {"role": "user", "content": f"{prompt}"},
                ],
            )

            return response.choices[0].message.content

        except Exception as e:
            return f"Error while generating a response: {e}"


class GPT_4o(LLM):
    def __init__(self):
        """Initialize GPT-4o model."""
        super().__init__("gpt-4o")

        load_dotenv()
        api_key = os.getenv("OPENAI_API_KEY")

        try:
            self.client = OpenAI(api_key=api_key)
        except Exception as e:
            print(f"Something went wrong with GPT-4o initialization:\n{e}")

    def generate_sync(self, system_prompt: str, prompt: str) -> str:
        try:
            response = self.client.chat.completions.create(
                model=self.model_name,
                messages=[
                    {"role": "system", "content": f"{system_prompt}"},
                    {"role": "user", "content": f"{prompt}"},
                ],
            )

            return response.choices[0].message.content

        except Exception as e:
            return f"Error while generating a response: {e}"
