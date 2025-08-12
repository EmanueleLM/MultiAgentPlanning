import sys
import os

# Add the "src" directory (not the project root) to sys.path
sys.path.insert(
    0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "src"))
)

from llm_plan.Parser import PDDLParser


def test_parser_pddl():
    parser = PDDLParser()
    assert parser is not None


def test_parser_pddl_with_text():
    parser = PDDLParser()
    domain_text, problem_text = parser.parse("./test/data/sample_pddl.txt")
    # TODO: add VAL to test if the domain and problem are proper PDDL files
    assert domain_text is not None
    assert problem_text is not None
