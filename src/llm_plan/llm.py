import asyncio
import os
from abc import ABC, abstractmethod
from typing import List, Optional, Tuple

import torch
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


class DeepSeekR170B(LLM):
    """
    Local DeepSeek R1 70B wrapper using Hugging Face transformers.

    Provides synchronous generation and an asynchronous batched interface that
    coalesces concurrent requests into a single model.generate call.

    Notes:
    - Default model name is a placeholder; pass the exact repo ID you have
      locally (e.g., "deepseek-ai/DeepSeek-R1-Distill-Llama-70B").
    - Uses tokenizer chat template if available; falls back to a simple format.
    """

    def __init__(
        self,
        model_name: str = "deepseek-ai/DeepSeek-R1-Distill-Llama-70B",
        device_map: str | dict = "auto",
        max_new_tokens: int = 2048,
        temperature: float = 0.2,
        top_p: float = 0.95,
        do_sample: bool = True,
        max_batch_size: int = 4,
        batch_max_wait_ms: int = 50,
    ):
        super().__init__(model_name=model_name)

        # HF objects (lazy-loaded)
        self.tokenizer: Optional[AutoTokenizer] = None
        self.model: Optional[AutoModelForCausalLM] = None

        # Generation/config
        self.device_map = device_map
        self.max_new_tokens = max_new_tokens
        self.temperature = temperature
        self.top_p = top_p
        self.do_sample = do_sample

        # Async-batching infra
        self._queue: asyncio.Queue[Tuple[str, str, asyncio.Future]] = asyncio.Queue()
        self._batch_task: Optional[asyncio.Task] = None
        self._max_batch_size = max_batch_size
        self._batch_max_wait = batch_max_wait_ms / 1000.0

    # ----------------------------
    # Internal helpers
    # ----------------------------
    def _ensure_model(self) -> None:
        if self.model is not None and self.tokenizer is not None:
            return

        # Load tokenizer first
        self.tokenizer = AutoTokenizer.from_pretrained(self.model_name, trust_remote_code=True)

        # Some models don’t define a pad token
        if self.tokenizer.pad_token is None and self.tokenizer.eos_token is not None:
            self.tokenizer.pad_token = self.tokenizer.eos_token

        # Load the model lazily
        self.model = AutoModelForCausalLM.from_pretrained(
            self.model_name,
            torch_dtype="auto",
            device_map=self.device_map,
            trust_remote_code=True,
        )
        self.model.eval()

    def _build_prompt(self, system_prompt: str, prompt: str) -> str:
        assert self.tokenizer is not None

        # Prefer chat template if available
        if hasattr(self.tokenizer, "apply_chat_template"):
            messages = [
                {"role": "system", "content": system_prompt},
                {"role": "user", "content": prompt},
            ]
            try:
                return self.tokenizer.apply_chat_template(
                    messages, tokenize=False, add_generation_prompt=True
                )
            except Exception:
                # Fallback to plain prompt formatting
                pass

        # Generic fallback: simple system/user/assistant turn
        return f"{system_prompt}\n\nUser: {prompt}\nAssistant:"

    def _generate_texts(self, inputs_text: List[str]) -> List[str]:
        """Blocking generation for a list of prompts. Runs on a background thread."""
        self._ensure_model()
        assert self.model is not None and self.tokenizer is not None

        device = self.model.device
        enc = self.tokenizer(
            inputs_text,
            return_tensors="pt",
            padding=True,
            truncation=False,
        )
        enc = {k: v.to(device) for k, v in enc.items()}

        with torch.no_grad():
            gen_out = self.model.generate(
                **enc,
                max_new_tokens=self.max_new_tokens,
                temperature=self.temperature,
                top_p=self.top_p,
                do_sample=self.do_sample,
                eos_token_id=self.tokenizer.eos_token_id,
                pad_token_id=self.tokenizer.pad_token_id,
            )

        # Decode only the generated continuation for each sequence
        input_lengths = enc["attention_mask"].sum(dim=1)
        results: List[str] = []
        for i in range(gen_out.size(0)):
            start = int(input_lengths[i].item())
            continuation_ids = gen_out[i, start:]
            text = self.tokenizer.decode(continuation_ids, skip_special_tokens=True)
            results.append(text if text else "No response generated.")

        return results

    async def _ensure_batch_worker(self) -> None:
        if self._batch_task is None or self._batch_task.done():
            self._batch_task = asyncio.create_task(self._batch_worker())

    async def _batch_worker(self) -> None:
        """Continuously gather items from the queue and run batched generation."""
        while True:
            system_prompt, prompt, fut = await self._queue.get()
            batch: List[Tuple[str, str, asyncio.Future]] = [(system_prompt, prompt, fut)]

            # Small window to accumulate more requests
            start_t = asyncio.get_running_loop().time()
            while len(batch) < self._max_batch_size:
                remaining = self._batch_max_wait - (asyncio.get_running_loop().time() - start_t)
                if remaining <= 0:
                    break
                try:
                    item = await asyncio.wait_for(self._queue.get(), timeout=remaining)
                    batch.append(item)
                except asyncio.TimeoutError:
                    break

            # Prepare inputs and run generation on a background thread
            try:
                prompts_text = [self._build_prompt(sp, p) for sp, p, _ in batch]
                outputs = await asyncio.to_thread(self._generate_texts, prompts_text)
                # Map back to individual futures
                for out, (_, _, f) in zip(outputs, batch):
                    if not f.cancelled():
                        f.set_result(out)
            except Exception as e:
                err = f"Error while generating a response: {e}"
                for _, _, f in batch:
                    if not f.cancelled():
                        f.set_result(err)

    # ----------------------------
    # Public API
    # ----------------------------
    def generate_sync(self, system_prompt: str, prompt: str) -> str:
        """Synchronous generation using HF transformers."""
        try:
            text = self._build_prompt(system_prompt, prompt)
            outputs = self._generate_texts([text])
            return outputs[0] if outputs else "No response generated."
        except Exception as e:
            return f"Error while generating a response: {e}"

    async def generate_async(self, system_prompt: str, prompt: str) -> str:
        """
        Asynchronous generation that batches concurrent requests.

        Returns a single string, consistent with other async functions in this file.
        """
        await self._ensure_batch_worker()
        fut: asyncio.Future = asyncio.get_running_loop().create_future()
        await self._queue.put((system_prompt, prompt, fut))
        return await fut
