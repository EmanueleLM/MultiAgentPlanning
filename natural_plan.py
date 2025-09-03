"""Benchmark NATURAL PLAN
It consists of three datasets:
- calendar scheduling
- meeting planning
- trip planning

We take the "prompt_0shot" and give it as natural language plan to our system.
If the plan succeeds in generating the pddl plan and the final naturalistic plan, we ask an LLM to
check if it is correct by comparing it to the "golden_plan".
"""
