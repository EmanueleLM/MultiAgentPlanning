import copy

from src.llm_plan.environment import Environment


class PackageDelivery(Environment):
    """
    A single-agent, static environment where a truck must deliver a package
    from a post office to a house. The environment itself does not change,
    but it presents a planning problem to the agent.
    """

    def __init__(self):
        """
        Initializes the Package Delivery environment.
        """
        super(PackageDelivery, self).__init__()
        self.locations = ["post-office", "house"]

        # Public information available to the agent
        self.public_information = [
            "A single package, initially at a post office, needs to be transported to a house using one truck.",
            "The truck can move between the post office and the house.",
        ]

        # Base knowledge for the agent, not including the initial state
        self._base_knowledge = {
            "Agent": [
                "I am the truck driver.",
                "To load the package, the truck must be at the same location as the package.",
                "To unload the package, it must first be inside the truck.",
                "The package cannot move on its own; it must be transported by the truck.",
            ]
        }

        # The agent's specific knowledge will be fully populated by reset()
        self.knowledge = {}

        # The final goal of the problem
        self.goal = {"Agent": "The package must be delivered to the house."}

        # The state of the environment, initialized by reset()
        self.state = {}

        self.reset()  # Initialize the environment to its starting state

    def reset(self):
        """
        Resets the environment to its initial state.
        The truck and the package are at the post office.
        """
        self.state = {
            "truck_at": "post-office",
            "package_at": "post-office",
            "in_truck": False,
        }

        # Create a fresh copy of knowledge and add the initial state information
        self.knowledge = copy.deepcopy(self._base_knowledge)
        initial_state_info = [
            f"The truck is currently at the {self.state['truck_at']}.",
            f"The package is currently at the {self.state['package_at']}.",
        ]
        self.knowledge["Agent"].extend(initial_state_info)

    def render(self):
        """
        Renders a text-based representation of the environment's current state.
        """
        print("--- Package Delivery Environment ---")
        print(f"Goal: {self.goal['Agent']}")

        print("\n--- Current State ---")
        truck_loc = self.state["truck_at"]
        pkg_loc = self.state["package_at"]
        in_truck = self.state["in_truck"]

        print(f"Truck Location: {truck_loc}")
        print(f"Package Location: {'Inside Truck' if in_truck else pkg_loc}")

        # Visual representation
        po_occupants = []
        house_occupants = []

        if truck_loc == "post-office":
            po_occupants.append("T(P)" if in_truck else "T")
        elif truck_loc == "house":
            house_occupants.append("T(P)" if in_truck else "T")

        if not in_truck:
            if pkg_loc == "post-office":
                po_occupants.append("P")
            elif pkg_loc == "house":
                house_occupants.append("P")

        print("\n--- Visual ---")
        print(
            f"[Post Office] {' '.join(sorted(po_occupants)):<5} <---> [House] {' '.join(sorted(house_occupants)):<5}"
        )
        print("T: Truck, P: Package, T(P): Package in Truck")
        print("------------------------------------")
