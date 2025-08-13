"""This is the main block of code that generates the code of a plan from a human specific."""

from dataclasses import dataclass
from typing import List


@dataclass
class TextToPlan:
    """Collection of prompts to turn a natural language specific into code for this repository."""

    # TODO: populate this class with the prompts to obtain the classes in
    # - StaticEnvironment.py,
    # - Problem.py,
    # and the relative code to run experiments.
    model: str = "ChatGPT-WebUI"
    chat: List[str] = [""]
    system_prompt: str = ""
    __link = "https://chatgpt.com/share/689cbbb6-b660-800e-b9df-a527be262c2e"  # this is the link to turn into a dataclass
