import os
from dotenv import load_dotenv
from google import genai
from openai import OpenAI
from transformers import AutoModelForCausalLM, AutoTokenizer


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
        return "Subclasses should implement this method."

class GPT_OSS(LLM):
    def __init__(self,
                 model_name: str="openai/gpt-oss-120b", 
                 map: str="auto", 
                 reasoning: str | None = "Low"):
        """
        Initialize the GPT-OSS model.

        Args:
            model_name (str): The model name as it appears in the HuggingFace models. Defaults to "openai/gpt-oss-120b".
            map (str): The device map for the model, default is "auto". Other options are "cpu", "cuda", etc.
            reasoning (str): The reasoning level for the model, default is "High". "Medium" and "Low" are also options.
            Keep in mind that the reasoning level is passed via the system prompt.
        """
        super().__init__(model_name=model_name)
        self.tokenizer = AutoTokenizer.from_pretrained(self.model_name)
        self.reasoning = reasoning.lower() if reasoning else "medium"

        # Load the model with CPU offloading
        self.model = AutoModelForCausalLM.from_pretrained(
            self.model_name,
            device_map={"": map},         # force everything on CPU
            torch_dtype="auto",
            offload_folder="./offload"       # optional: swap large tensors to disk
        )

    def generate_sync(self, system_prompt: str, prompt: str) -> str:
        try:
            full_prompt = f"{system_prompt}\nReasoning: {self.reasoning}\n\nUser: {prompt}\nAssistant:"
            inputs = self.tokenizer(full_prompt, return_tensors="pt").to(self.model.device)
            outputs = self.model.generate(**inputs, max_new_tokens=2000)

            return self.tokenizer.decode(outputs[0], skip_special_tokens=True)

        except Exception as e:
            return f"Error while generating a response: {e}"
        

class GPT_OSS_Ollama(LLM):
    def __init__(self, 
                 model_name: str = "gpt-oss-20b", 
                 reasoning: str | None = "High"):
        """
        Initialize the GPT_Ollama model.
        Instructions can be found here to init the model:
        https://cookbook.openai.com/articles/gpt-oss/run-locally-ollama

        Args:
            model_name (str): The model name as it appears in the Ollama models. Defaults to "gpt-oss-20b".
            reasoning (str): The reasoning level for the model, default is "High". "Medium" and "Low" are also options.
            Keep in mind that the reasoning level is passed via the system prompt.
        """
        super().__init__(model_name=model_name)
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
            assert model_name in self._available_models, (
                f"Model {model_name} not found in OpenAI models."
            )
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
        
class Gemini(LLM):
    def __init__(self, model_name: str = "gemini-2.5-lite"):
        """Load a Gemini model.

        Args:
            model_name (str, optional): The model as it appears on the Gemini APIs. Defaults to "gemini-2.5-lite".
        """
        super().__init__(model_name=model_name)

        load_dotenv()
        api_key = os.getenv("GEMINI_API_KEY")

        try:
            self.client = genai.Client()
        except Exception as e:
            print(f"Something went wrong with {model_name} initialization:\n{e}")

    def generate_sync(self, system_prompt: str, prompt: str) -> str:
        try:
            response = self.client.models.generate_content(
                model=self.model_name, 
                contents=f"{system_prompt}\n\nUser: {prompt}\nAssistant:"
            )

            return (
                "No response generated."
                if response.text is None
                else response.text
            )

        except Exception as e:
            return f"Error while generating a response: {e}"
