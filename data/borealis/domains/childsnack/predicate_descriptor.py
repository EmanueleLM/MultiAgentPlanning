def describe_predicate(predicate_name, predicate_args):
    """
    Predicates:
    - (at_kitchen_bread ?b - bread-portion)
    - (at_kitchen_content ?c - content-portion)
    - (at_kitchen_sandwich ?s - sandwich)
    - (no_gluten_bread ?b - bread-portion)
    - (no_gluten_content ?c - content-portion)
    - (ontray ?s - sandwich ?t - tray)
    - (no_gluten_sandwich ?s - sandwich)
    - (allergic_gluten ?c - child)
    - (not_allergic_gluten ?c - child)
    - (served ?c - child)
    - (waiting ?c - child ?p - place)
    - (at ?t - tray ?p - place)
    - (notexist ?s - sandwich)

    :param predicate_name: str
    :param predicate_args: Tuple[str]
    :return: Tuple[str, str] - (positive, negative)
    """
    # (at_kitchen_bread ?b - bread-portion)
    if predicate_name == "at_kitchen_bread":
        (b,) = predicate_args
        return f"Bread portion {b} is at the kitchen.", f"Bread portion {b} is not at the kitchen."
    # (at_kitchen_content ?c - content-portion)
    elif predicate_name == "at_kitchen_content":
        (c,) = predicate_args
        return f"Content portion {c} is at the kitchen.", f"Content portion {c} is not at the kitchen."
    # (at_kitchen_sandwich ?s - sandwich)
    elif predicate_name == "at_kitchen_sandwich":
        (s,) = predicate_args
        return f"Sandwich {s} is at the kitchen.", f"Sandwich {s} is not at the kitchen."
    # (no_gluten_bread ?b - bread-portion)
    elif predicate_name == "no_gluten_bread":
        (b,) = predicate_args
        return f"Bread portion {b} is gluten-free.", f"Bread portion {b} is not gluten-free."
    # (no_gluten_content ?c - content-portion)
    elif predicate_name == "no_gluten_content":
        (c,) = predicate_args
        return f"Content portion {c} is gluten-free.", f"Content portion {c} is not gluten-free."
    # (ontray ?s - sandwich ?t - tray)
    elif predicate_name == "ontray":
        (s, t) = predicate_args
        return f"Sandwich {s} is on tray {t}.", f"Sandwich {s} is not on tray {t}."
    # (no_gluten_sandwich ?s - sandwich)
    elif predicate_name == "no_gluten_sandwich":
        (s,) = predicate_args
        return f"Sandwich {s} is gluten-free.", f"Sandwich {s} is not gluten-free."
    # (allergic_gluten ?c - child)
    elif predicate_name == "allergic_gluten":
        (c,) = predicate_args
        return f"Child {c} is allergic to gluten.", f"Child {c} is not allergic to gluten."
    # (not_allergic_gluten ?c - child)
    elif predicate_name == "not_allergic_gluten":
        (c,) = predicate_args
        return f"Child {c} is not allergic to gluten.", f"Child {c} is allergic to gluten."
    # (served ?c - child)
    elif predicate_name == "served":
        (c,) = predicate_args
        return f"Child {c} has been served.", f"Child {c} has not been served."
    # (waiting ?c - child ?p - place)
    elif predicate_name == "waiting":
        (c, p) = predicate_args
        return f"Child {c} is waiting at place {p}.", f"Child {c} is not waiting at place {p}."
    # (at ?t - tray ?p - place)
    elif predicate_name == "at":
        (t, p) = predicate_args
        return f"Tray {t} is at place {p}.", f"Tray {t} is not at place {p}."
    # (notexist ?s - sandwich)
    elif predicate_name == "notexist":
        (s,) = predicate_args
        return f"Sandwich {s} does not exist.", f"Sandwich {s} exists."
    else:
        raise ValueError(f"Unknown predicate: {predicate_name}")