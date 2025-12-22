def describe_predicate(predicate_name, predicate_args):
    """
    Predicates:
    - (robot-at ?r - robot ?x - tile)
    - (up ?x - tile ?y - tile)
    - (down ?x - tile ?y - tile)
    - (right ?x - tile ?y - tile)
    - (left ?x - tile ?y - tile)
    - (clear ?x - tile)
    - (painted ?x - tile ?c - color)
    - (robot-has ?r - robot ?c - color)
    - (available-color ?c - color)
    - (free-color ?r - robot)

    :param predicate_name: str
    :param predicate_args: Tuple[str]
    :return: Tuple[str, str] - (positive, negative)
    """
    # (robot-at ?r - robot ?x - tile)
    if predicate_name == "robot-at":
        robot, tile = predicate_args
        return f"Robot {robot} is at tile {tile}.", f"Robot {robot} is not at tile {tile}."
    # (up ?x - tile ?y - tile)
    elif predicate_name == "up":
        x, y = predicate_args
        return f"Tile {y} is up from tile {x}.", f"Tile {y} is not up from tile {x}."
    # (down ?x - tile ?y - tile)
    elif predicate_name == "down":
        x, y = predicate_args
        return f"Tile {y} is down from tile {x}.", f"Tile {y} is not down from tile {x}."
    # (right ?x - tile ?y - tile)
    elif predicate_name == "right":
        x, y = predicate_args
        return f"Tile {y} is to the right of tile {x}.", f"Tile {y} is not to the right of tile {x}."
    # (left ?x - tile ?y - tile)
    elif predicate_name == "left":
        x, y = predicate_args
        return f"Tile {y} is to the left of tile {x}.", f"Tile {y} is not to the left of tile {x}."
    # (clear ?x - tile)
    elif predicate_name == "clear":
        (tile,) = predicate_args
        return f"Tile {tile} is clear.", f"Tile {tile} is not clear."
    # (painted ?x - tile ?c - color)
    elif predicate_name == "painted":
        tile, color = predicate_args
        return f"Tile {tile} is painted with color {color}.", f"Tile {tile} is not painted with color {color}."
    # (robot-has ?r - robot ?c - color)
    elif predicate_name == "robot-has":
        robot, color = predicate_args
        return f"Robot {robot} has a spray gun with color {color}.", f"Robot {robot} does not have a spray gun with color {color}."
    # (available-color ?c - color)
    elif predicate_name == "available-color":
        (color,) = predicate_args
        return f"Color {color} is available.", f"Color {color} is not available."
    # (free-color ?r - robot)
    elif predicate_name == "free-color":
        (robot,) = predicate_args
        return f"Robot {robot} can change its spray gun color.", f"Robot {robot} cannot change its spray gun color."
    else:
        raise ValueError(f"Unknown predicate: {predicate_name}")