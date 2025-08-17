import re
import typing as T
from abc import ABC, abstractmethod


class Parser(ABC):
    """
    Abstract base class for parsers.
    """

    @abstractmethod
    def parse(self, text: str):
        """
        Parse the given text and return a structured representation.

        Args:
            text (str): The text to parse.

        Returns:
            A structured representation of the parsed text.
        """
        pass


class PDDLParser(Parser):
    """
    Parser for PDDL (Planning Domain Definition Language).

    # -------------------------
    # Example usage:
    # -------------------------
    if __name__ == "__main__":
        sample_path = "text_and_pddl.txt"
        domain_text, problem_text = extract_pddl_from_file(sample_path)
        print("DOMAIN:\n", domain_text[:400], "...\n")
        print("PROBLEM:\n", problem_text[:400], "...\n")
    """

    def __init__(self):
        super().__init__()

    def _skip_ws_and_comments(self, text: str, i: int) -> int:
        n = len(text)
        while i < n:
            c = text[i]
            if c.isspace():
                i += 1
                continue
            if c == ";":  # line comment -> skip to newline
                while i < n and text[i] != "\n":
                    i += 1
                continue
            break
        return i

    def _read_symbol(self, text: str, i: int) -> T.Tuple[T.Optional[str], int]:
        """Read a symbol starting at i (assumes whitespace/comments already skipped).
        Symbol ends at whitespace or '(' or ')' or ';' or '\"'. Returns (symbol, next_index)."""
        n = len(text)
        if i >= n:
            return None, i
        if text[i] in '();"':
            return None, i
        j = i
        while j < n and not text[j].isspace() and text[j] not in '();"':
            j += 1
        return text[i:j], j

    def _extract_balanced(self, text: str, start: int) -> T.Tuple[str, int]:
        """Given start index pointing to '(', extract the full balanced s-expression.
        Returns (s_expr_text, end_index). Raises ValueError on unbalanced parentheses."""
        n = len(text)
        assert start < n and text[start] == "("
        i = start
        depth = 0
        in_string = False
        while i < n:
            ch = text[i]
            if in_string:
                if ch == "\\" and i + 1 < n:  # escaped char inside string
                    i += 2
                    continue
                if ch == '"':
                    in_string = False
                i += 1
                continue

            # when not in string:
            if ch == '"':
                in_string = True
                i += 1
                continue

            if ch == ";":  # line comment
                while i < n and text[i] != "\n":
                    i += 1
                continue

            if ch == "(":
                depth += 1
            elif ch == ")":
                depth -= 1
                if depth == 0:
                    return text[start : i + 1], i
            i += 1

        raise ValueError(f"Unbalanced parentheses starting at index {start}")

    def extract_pddl_sections(
        self, text: str, all_matches: bool = False
    ) -> T.Dict[str, T.List[str]]:
        """
        Extract all '(define (domain ...))' and '(define (problem ...))' s-expressions from `text`.
        Returns dict: {'domain': [<domains>], 'problem': [<problems>]}.
        If all_matches=False, it still returns lists but only the first occurrence of each kind is collected.
        """
        n = len(text)
        i = 0
        found: dict = {"domain": [], "problem": []}

        while i < n:
            ch = text[i]

            # skip comment starts or strings at top-level
            if ch == ";":
                while i < n and text[i] != "\n":
                    i += 1
                continue
            if ch == '"':
                i += 1
                # skip until closing (handle escapes)
                while i < n:
                    if text[i] == "\\" and i + 1 < n:
                        i += 2
                        continue
                    if text[i] == '"':
                        i += 1
                        break
                    i += 1
                continue

            if ch == "(":
                # try to see if this is "(define (domain" or "(define (problem"
                j = i + 1
                j = self._skip_ws_and_comments(text, j)
                token1, j_after = self._read_symbol(text, j)
                if token1 is not None and token1.lower() == "define":
                    # find next '(' after 'define' (skip whitespace/comments)
                    k = j_after
                    k = self._skip_ws_and_comments(text, k)
                    if k < n and text[k] == "(":
                        k2 = k + 1
                        k2 = self._skip_ws_and_comments(text, k2)
                        token2, _ = self._read_symbol(text, k2)
                        if token2 is not None and token2.lower() in (
                            "domain",
                            "problem",
                        ):
                            # extract balanced s-expression beginning at i
                            s_expr, end_idx = self._extract_balanced(text, i)
                            kind = token2.lower()
                            found[kind].append(s_expr)
                            i = end_idx + 1
                            # if not all_matches and both found at least one, we can finish early
                            if not all_matches and all(
                                found[k] for k in ("domain", "problem")
                            ):
                                break
                            continue
                # otherwise just move one char forward
                i += 1
                continue

            i += 1

        return found

    def extract_first_domain_and_problem(
        self,
        text: str,
    ) -> T.Tuple[T.Optional[str], T.Optional[str]]:
        """
        Convenience: returns (first_domain, first_problem). If not found, returns None in place.
        """
        found = self.extract_pddl_sections(text, all_matches=False)
        domain = found["domain"][0] if found["domain"] else None
        problem = found["problem"][0] if found["problem"] else None
        return domain, problem

    def parse(
        self, source: str, from_file: bool = True
    ) -> T.Tuple[T.Optional[str], T.Optional[str]]:
        """
        Parse either from a file path (default) or directly from a PDDL string.

        Args:
            source: Either a file path (if from_file=True) or a PDDL text string.
            from_file: If True, treat `source` as a path to read from disk.
                       If False, treat `source` as raw PDDL text.

        Returns:
            (domain, problem) strings or None if not found.
        """
        if from_file:
            with open(source, "r", encoding="utf-8") as fh:
                txt = fh.read()
        else:
            txt = source

        return self.extract_first_domain_and_problem(txt)


class PythonCodeParser(Parser):
    """
    Parser to extract Python code blocks from natural-language text
    by detecting typical Python syntax.
    """

    def __init__(self):
        super().__init__()
        # Regex patterns for common Python code
        self.patterns = [
            r"^\s*def\s+\w+\s*\(.*\)\s*:",  # function
            r"^\s*class\s+\w+\s*(\(.*\))?\s*:",  # class
            r"^\s*(if|elif|else|for|while|try|except|with)\b.*:",  # control flow
            r"^\s*(import|from)\s+[\w\.]+",  # imports
            r"^\s*\w+\s*=\s*.+",  # assignment
            r"^\s*return\s+.*",  # return statement
        ]
        self.compiled_patterns = [re.compile(p) for p in self.patterns]

    def _is_python_line(self, line: str) -> bool:
        """Return True if the line matches Python syntax heuristics."""
        line = line.rstrip()
        if not line:
            return False
        for pat in self.compiled_patterns:
            if pat.match(line):
                return True
        return False

    def extract_code_blocks(self, text: str, all_matches: bool = False) -> T.List[str]:
        """
        Extract Python code blocks based on syntax heuristics.

        Args:
            text: Input text
            all_matches: If True, return all code blocks; else only first.

        Returns:
            List of Python code strings.
        """
        code_blocks: T.List[str] = []
        lines = text.splitlines()
        current_block: T.List[str] = []

        for line in lines:
            if self._is_python_line(line):
                current_block.append(line)
            else:
                if current_block:
                    code_blocks.append("\n".join(current_block))
                    if not all_matches:
                        return code_blocks
                    current_block = []

        if current_block:
            code_blocks.append("\n".join(current_block))

        return code_blocks

    def extract_first_code_block(self, text: str) -> T.Optional[str]:
        blocks = self.extract_code_blocks(text, all_matches=False)
        return blocks[0] if blocks else None

    def parse(self, text: str) -> T.Optional[str]:
        """Parse Python code directly from a string."""
        return self.extract_first_code_block(text)
