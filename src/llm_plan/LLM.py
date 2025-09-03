import os
from openai import OpenAI


class LLM:
    """
    A class representing a Language Model (LLM) that can generate problems (e.g., pddl) based on observations and prompts.
    """

    def __init__(self, model_name: str = "LLM (Abstract)"):
        """
        Initialize the LLM with a specific model.

        Args:
            model: The language model to be used for generating actions.
        """
        self.model_name = model_name

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
        raise NotImplementedError("Subclasses should implement this method.")


class GPT(LLM):
    def __init__(self, model: str, reasoning: str = "high"):
        super().__init__(model)
        """
        Initialize an OpenAI GPT model.
        Instructions for ollama can be found: https://cookbook.openai.com/articles/gpt-oss/run-locally-ollama
        By default, assumes the API key is stored as an environment variable OpenAI_key
        Args:
            model (str): The model name, a member of the lists below.
            reasoning (str, optional): The reasoning level for the model, "minimal", "low", "medium" or
                "high". Default is "high".
                https://platform.openai.com/docs/guides/reasoning
        """
        self.reasoning = None
        # List of reasoning and non-reasoning models
        models_reas = [
            "gpt-5",
            "gpt-5-chat-latest",
            "gpt-5-mini",
            "gpt-5-nano",
            "gpt-oss-120b",
            "gpt-o4-mini",
            "gpt-o3",
            "gpt-o3-mini",
        ]
        models_nonr = ["gpt-4o", "gpt-4o-mini", "gpt-4.1", "gpt-4.1-mini"]
        if model not in models_reas + models_nonr:
            raise ValueError(f"Unsupported model {model}!")
        elif model in models_reas:
            self.reasoning = {"effort": reasoning}

        try:
            self.client = OpenAI(api_key=os.getenv("OpenAI_key"))
        except Exception as e:
            return f"Something went wrong with {self.model_name} initialization: \n{e}"

    def generate_sync(self, system_prompt: str, prompt: str) -> str:
        try:
            response = self.client.responses.create(
                model=self.model_name,
                reasoning=self.reasoning,
                input=[
                    {"role": "system", "content": f"{system_prompt}"},
                    {"role": "user", "content": f"{prompt}"},
                ],
            )

            return response.output_text

        except Exception as e:
            return f"Error while generating a response: {e}"


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

            return (
                "No response generated."
                if response.choices[0].message.content is None
                else response.choices[0].message.content
            )

        except Exception as e:
            return f"Error while generating a response: {e}"


class ChatGPT(LLM):
    def __init__(self, model_name: str = "gpt-4o"):
        """Load a ChatGPT model.

        Args:
            model_name (str, optional): The model as it appears on the ChatGPT APIs. Defaults to "gpt-4o".
        """
        super().__init__(model_name=model_name)

        load_dotenv()
        api_key = os.getenv("OPENAI_API_KEY")

        try:
            self.client = OpenAI(api_key=api_key)
            self._available_models = [m.id for m in self.client.models.list().data]
            assert (
                model_name in self._available_models
            ), f"Model {model_name} not found in OpenAI models."
        except Exception as e:
            print(f"Something went wrong with {model_name} initialization:\n{e}")

    def generate_sync(self, system_prompt: str, prompt: str) -> str:
        try:
            response = self.client.chat.completions.create(
                model=self.model_name,
                messages=[
                    {"role": "system", "content": f"{system_prompt}"},
                    {"role": "user", "content": f"{prompt}"},
                ],
            )

            return (
                "No response generated."
                if response.choices[0].message.content is None
                else response.choices[0].message.content
            )

        except Exception as e:
            return f"Error while generating a response: {e}"
