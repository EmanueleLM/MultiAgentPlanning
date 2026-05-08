(define (domain sokoban)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location
        agent
        item
    )
    (:predicates
        (at_player ?l - location)
        (at_box ?l - location)
        (is_goal ?l - location)
        (is_wall ?l - location)
        (adj_left ?l1 ?l2 - location)
        (adj_right ?l1 ?l2 - location)
        (adj_up ?l1 ?l2 - location)
        (adj_down ?l1 ?l2 - location)
    )

    ; Player moves to an adjacent empty cell
    (:action move_left
        :parameters (?from - location ?to - location)
        :precondition (and
            (at_player ?from)
            (adj_left ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?to))
            (not (at_player ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
        )
    )

    (:action move_right
        :parameters (?from - location ?to - location)
        :precondition (and
            (at_player ?from)
            (adj_right ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?to))
            (not (at_player ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
        )
    )

    (:action move_up
        :parameters (?from - location ?to - location)
        :precondition (and
            (at_player ?from)
            (adj_up ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?to))
            (not (at_player ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
        )
    )

    (:action move_down
        :parameters (?from - location ?to - location)
        :precondition (and
            (at_player ?from)
            (adj_down ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?to))
            (not (at_player ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
        )
    )

    ; Player pushes a box to an adjacent empty cell
    (:action push_left
        :parameters (?p_from - location ?b_from - location ?b_to - location)
        :precondition (and
            (at_player ?p_from)
            (at_box ?b_from)
            (adj_right ?p_from ?b_from) ; Player is immediately to the right of the box
            (adj_left ?b_from ?b_to)    ; Box is pushed one cell to its left
            (not (is_wall ?b_to))
            (not (at_player ?b_to))
            (not (at_box ?b_to))
        )
        :effect (and
            (not (at_player ?p_from))
            (at_player ?b_from) ; Player moves to where the box was
            (not (at_box ?b_from))
            (at_box ?b_to)      ; Box moves to its new position
        )
    )

    (:action push_right
        :parameters (?p_from - location ?b_from - location ?b_to - location)
        :precondition (and
            (at_player ?p_from)
            (at_box ?b_from)
            (adj_left ?p_from ?b_from)  ; Player is immediately to the left of the box
            (adj_right ?b_from ?b_to)   ; Box is pushed one cell to its right
            (not (is_wall ?b_to))
            (not (at_player ?b_to))
            (not (at_box ?b_to))
        )
        :effect (and
            (not (at_player ?p_from))
            (at_player ?b_from)
            (not (at_box ?b_from))
            (at_box ?b_to)
        )
    )

    (:action push_up
        :parameters (?p_from - location ?b_from - location ?b_to - location)
        :precondition (and
            (at_player ?p_from)
            (at_box ?b_from)
            (adj_down ?p_from ?b_from)  ; Player is immediately below the box
            (adj_up ?b_from ?b_to)      ; Box is pushed one cell up
            (not (is_wall ?b_to))
            (not (at_player ?b_to))
            (not (at_box ?b_to))
        )
        :effect (and
            (not (at_player ?p_from))
            (at_player ?b_from)
            (not (at_box ?b_from))
            (at_box ?b_to)
        )
    )

    (:action push_down
        :parameters (?p_from - location ?b_from - location ?b_to - location)
        :precondition (and
            (at_player ?p_from)
            (at_box ?b_from)
            (adj_up ?p_from ?b_from)    ; Player is immediately above the box
            (adj_down ?b_from ?b_to)    ; Box is pushed one cell down
            (not (is_wall ?b_to))
            (not (at_player ?b_to))
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