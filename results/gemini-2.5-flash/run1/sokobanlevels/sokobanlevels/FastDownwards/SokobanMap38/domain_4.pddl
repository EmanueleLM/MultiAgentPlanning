(define (domain sokoban-map38)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        cell
        agent
        box
    )
    (:predicates
        (at_agent ?a - agent ?c - cell)
        (at_box ?b - box ?c - cell)
        (is_goal ?c - cell)
        (is_wall ?c - cell)
        (adj_left ?c1 - cell ?c2 - cell)
        (adj_right ?c1 - cell ?c2 - cell)
    )

    ;; Player movement (without pushing a box)
    (:action move_player_left
        :parameters (?p - agent ?b - box ?from - cell ?to - cell)
        :precondition (and
            (at_agent ?p ?from)
            (adj_left ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?b ?to)) ; Player cannot move into a cell occupied by the box
        )
        :effect (and
            (not (at_agent ?p ?from))
            (at_agent ?p ?to)
        )
    )

    (:action move_player_right
        :parameters (?p - agent ?b - box ?from - cell ?to - cell)
        :precondition (and
            (at_agent ?p ?from)
            (adj_right ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?b ?to)) ; Player cannot move into a cell occupied by the box
        )
        :effect (and
            (not (at_agent ?p ?from))
            (at_agent ?p ?to)
        )
    )

    ;; Box pushing actions
    (:action push_box_left
        :parameters (?p - agent ?b - box ?player_from - cell ?box_from - cell ?box_to - cell)
        :precondition (and
            (at_agent ?p ?player_from)
            (at_box ?b ?box_from)
            (adj_left ?player_from ?box_from)   ; Player is to the right of the box
            (adj_left ?box_from ?box_to)        ; Box target is to the left of the box
            (not (is_wall ?box_to))             ; Box cannot move into a wall
            ;; (not (at_box ?b ?box_to)) is implicitly true as ?box_from and ?box_to are distinct
            ;; for a single box, and no other box can occupy ?box_to.
        )
        :effect (and
            (not (at_agent ?p ?player_from))
            (at_agent ?p ?box_from)             ; Player moves to the box's original position
            (not (at_box ?b ?box_from))
            (at_box ?b ?box_to)                 ; Box moves to the target position
        )
    )

    (:action push_box_right
        :parameters (?p - agent ?b - box ?player_from - cell ?box_from - cell ?box_to - cell)
        :precondition (and
            (at_agent ?p ?player_from)
            (at_box ?b ?box_from)
            (adj_right ?player_from ?box_from)  ; Player is to the left of the box
            (adj_right ?box_from ?box_to)       ; Box target is to the right of the box
            (not (is_wall ?box_to))             ; Box cannot move into a wall
        )
        :effect (and
            (not (at_agent ?p ?player_from))
            (at_agent ?p ?box_from)
            (not (at_box ?b ?box_from))
            (at_box ?b ?box_to)
        )
    )
)