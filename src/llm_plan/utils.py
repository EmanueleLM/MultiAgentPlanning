import ast
import black
import re
from pathlib import Path


def find_project_root(current_file: Path) -> Path:
    for parent in current_file.resolve().parents:
        if (parent / ".git").exists() or (parent / "pyproject.toml").exists():
            return parent
    return current_file.resolve().parent  # fallback


def find_project_code(current_file: Path) -> Path:
    for parent in current_file.resolve().parents:
        # TODO: handle this with a more robust check
        if (parent / "src" / "llm_plan").exists():
            return parent / "src" / "llm_plan"
    return current_file.resolve().parent  # fallback


def to_snake_case(s: str) -> str:
    try:
        # Insert underscore before capital letters (except first)
        s = re.sub(r"(?<!^)(?=[A-Z])", "_", s)
    except:  # Ok to have bare exception here. If it fails, we just return the original string
        pass

    return s.lower()


def check_syntax(code_str: str) -> bool:
    """This function checks if the given code string has valid Python syntax."""
    try:
        compile(code_str, "<string>", "exec")
        return True
    except SyntaxError as e:
        print(f"Syntax error: {e}")
        return False


def write_formatted(code_str: str, file_path: str):
    """This function appends the given code string to a file at the specified path."""
    try:
        formatted_code = black.format_str(code_str, mode=black.Mode())
    except black.NothingChanged:
        formatted_code = code_str

    with open(file_path, "a", encoding="utf-8") as f:
        f.write("\n\n")
        f.write(formatted_code.strip())
        f.write("\n")
    print(f"Code appended successfully to {file_path}")


def extract_class_code(file_path: str, class_name: str) -> str | None:
    """
    Finds a class by name in a Python file and returns its formatted code.

    Args:
        file_path (str): Path to the Python file.
        class_name (str): Name of the class to search for.

    Returns:
        str | None: The formatted class code, or None if not found.
    """
    with open(file_path, "r", encoding="utf-8") as f:
        file_content = f.read()

    tree = ast.parse(file_content)

    for node in ast.walk(tree):
        if isinstance(node, ast.ClassDef) and node.name == class_name:
            try:
                # Turn AST node back into code
                code_str = ast.unparse(node)
            except AttributeError:
                raise RuntimeError("ast.unparse requires Python 3.9 or newer")

            # Format with black for nice output
            try:
                code_str = black.format_str(code_str, mode=black.Mode())
            except black.NothingChanged:
                pass

            return code_str

    return None
