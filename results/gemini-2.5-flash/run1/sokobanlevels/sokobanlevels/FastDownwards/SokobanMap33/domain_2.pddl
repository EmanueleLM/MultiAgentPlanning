(define (domain sokobanmap33)
    (:requirements :strips :typing :negative-preconditions)
    (:types player box location)
    (:predicates
        (at_player ?l - location)
        (at_box ?l - location)
        (is_goal ?l - location)
        (is_wall ?l - location)
        (adj_left ?from ?to - location)
        (adj_right ?from ?to - location)
    )

    (:action move_player_left
        :parameters (?from - location ?to - location)
        :precondition (and
            (at_player ?from)
            (adj_left ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
        )
    )

    (:action move_player_right
        :parameters (?from - location ?to - location)
        :precondition (and
            (at_player ?from)
            (adj_right ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
        )
    )

    (:action push_box_left
        :parameters (?p_from - location ?b_from - location ?b_to - location)
        :precondition (and
            (at_player ?p_from)
            (at_box ?b_from)
            (adj_left ?p_from ?b_from)
            (adj_left ?b_from ?b_to)
            (not (is_wall ?b_to))
            (not (at_box ?b_to))
        )
        :effect (and
            (not (at_player ?p_from))
            (at_player ?b_from)
            (not (at_box ?b_from))
            (at_box ?b_to)
        )
    )

    (:action push_box_right
        :parameters (?p_from - location ?b_from - location ?b_to - location)
        :precondition (and
            (at_player ?p_from)
            (at_box ?b_from)
            (adj_right ?p_from ?b_from)
            (adj_right ?b_from ?b_to)
            (not (is_wall ?b_to))
            (not (at_box ?b_to))
        )
        :effect (and
            (not (at_player ?p_from))
            (at_player ?b_from)
            (not (at_box ?b_from))
            (at_box ?b_to)
        )
    )
)