from typing import List


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
        self.model = model

    def generate(
        self,
        prompt: str,
        observations: List[object] = [None],
    ):
        """
        Generate a reponse given a prompt.

        Args:
            prompt: The prompt.

        Returns:
            The answer of the model.
        """
        # This method should be implemented by subclasses
        raise NotImplementedError("Subclasses should implement this method.")
