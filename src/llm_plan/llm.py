import asyncio
import os
from abc import ABC, abstractmethod
from dotenv import load_dotenv
from google import genai
from openai import OpenAI, AsyncOpenAI
from transformers import AutoModelForCausalLM, AutoTokenizer


class LLM(ABC):
    """
    Abstract base class representing a Language Model (LLM).
    Subclasses must implement the generation methods.
    """

    def __init__(self, model_name: str = "LLM (Abstract)"):
        """
        Initialize the LLM with a specific model name.
        """
        self.model_name = model_name

    @abstractmethod
    def generate_sync(self, system_prompt: str, prompt: str) -> str:
        """
        Generate a response synchronously given a prompt.

        Args:
            system_prompt (str): The system prompt.
            prompt (str): The prompt.

        Returns:
            str: The model's response.
        """
        pass

    async def generate_async(self, system_prompt: str, prompt: str) -> str:
        """
        Generate a response asynchronously given a prompt.

        Subclasses may override this for true async implementations.
        By default, it runs the synchronous version in a thread.

        Args:
            system_prompt (str): The system prompt.
            prompt (str): The prompt.

        Returns:
            str: The model's response.
        """
        return await asyncio.to_thread(self.generate_sync, system_prompt, prompt)
    
    
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
        self.map = map
        self.reasoning = reasoning.lower() if reasoning else "medium"

        # This prevents importing the module from loading the actual model
        self.model = None

    def generate_sync(self, system_prompt: str, prompt: str) -> str:
        
        # Dynamically load the model (if not already loaded)
        if self.model is None:
            self.model = AutoModelForCausalLM.from_pretrained(
                self.model_name,
                device_map={"": map},
                torch_dtype="auto",
                offload_folder="./offload"
            )
        
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
    def __init__(self, model_name: str = "gpt-5-mini",
                 api_key_env: str="OPENAI_API_KEY"):
        super().__init__(model_name=model_name)

        load_dotenv()
        api_key = os.getenv(api_key_env)

        try:
            # Sync client
            self.client = OpenAI(api_key=api_key)
            # Async client
            self.async_client = AsyncOpenAI(api_key=api_key)

            self._available_models = [m.id for m in self.client.models.list().data]
            assert model_name in self._available_models, (
                f"Model {model_name} not found in OpenAI models."
            )
        except Exception as e:
            print(f"Something went wrong with {model_name} initialization:\n{e}")

    def generate_sync(self, system_prompt: str, prompt: str) -> str:
        """Synchronous ChatGPT call."""
        try:
            response = self.client.chat.completions.create(
                model=self.model_name,
                messages=[
                    {"role": "system", "content": system_prompt},
                    {"role": "user", "content": prompt},
                ],
            )
            return response.choices[0].message.content or "No response generated."
        except Exception as e:
            return f"Error while generating a response: {e}"

    async def generate_async(self, system_prompt: str, prompt: str) -> str:
        """Asynchronous ChatGPT call."""
        try:
            response = await self.async_client.chat.completions.create(
                model=self.model_name,
                messages=[
                    {"role": "system", "content": system_prompt},
                    {"role": "user", "content": prompt},
                ],
            )
            return response.choices[0].message.content or "No response generated."
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
        api_key = os.getenv("GOOGLE_API_KEY")

        try:
            # Sync client
            self.client = genai.Client(api_key=api_key)
            # Async client
            self.async_client = genai.AsyncClient(api_key=api_key)
        except Exception as e:
            print(f"Something went wrong with {model_name} initialization:\n{e}")

    def generate_sync(self, system_prompt: str, prompt: str) -> str:
        """Synchronous Gemini call."""
        try:
            response = self.client.models.generate_content(
                model=self.model_name,
                contents=f"{system_prompt}\n\nUser: {prompt}\nAssistant:",
            )
            return response.text or "No response generated."
        except Exception as e:
            return f"Error while generating a response: {e}"

    async def generate_async(self, system_prompt: str, prompt: str) -> str:
        """Asynchronous Gemini call."""
        try:
            response = await self.async_client.models.generate_content(
                model=self.model_name,
                contents=f"{system_prompt}\n\nUser: {prompt}\nAssistant:",
            )
            return response.text or "No response generated."
        except Exception as e:
            return f"Error while generating a response: {e}"

