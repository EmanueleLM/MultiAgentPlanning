import string
from typing import Any, List, Dict


def get_fields_in_formatted_string(formatted_string: str) -> list[str]:
    """Extract field names from a formatted string.
    Example:
        >>> get_fields_in_formatted_string("Hello, {name}! Today is {day}.")
        ['name', 'day']
    """
    formatter = string.Formatter()
    return [
        fname
        for _, fname, _, _ in formatter.parse(formatted_string)
        if fname is not None
    ]


def get_json_nested_fields(data: Dict[str, Any], keys: List[str]) -> Any:
    """
    Retrieve a nested value from a dictionary given a list of keys.

    Example:
        get_nested({"a": {"b": {"c": 1}}}, ["a", "b", "c"]) -> 1
    """
    for k in keys:
        data = data[k]
    return data
