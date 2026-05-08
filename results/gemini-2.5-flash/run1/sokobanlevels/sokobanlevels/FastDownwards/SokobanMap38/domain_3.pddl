(define (domain sokoban-map38)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        cell
        agent
        box
    )
    (:constants
        b1 - box ; Declare b1 as a constant of type box, visible to action schemas
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
    (:action move_left
        :parameters (?p - agent ?from - cell ?to - cell)
        :precondition (and
            (at_agent ?p ?from)
            (adj_left ?from ?to)
            (not (is_wall ?to))
            (not (at_box b1 ?to)) ; Reference to global constant b1
        )
        :effect (and
            (not (at_agent ?p ?from))
            (at_agent ?p ?to)
        )
    )

    (:action move_right
        :parameters (?p - agent ?from - cell ?to - cell)
        :precondition (and
            (at_agent ?p ?from)
            (adj_right ?from ?to)
            (not (is_wall ?to))
            (not (at_box b1 ?to)) ; Reference to global constant b1
        )
        :effect (and
            (not (at_agent ?p ?from))
            (at_agent ?p ?to)
        )
    )

    ;; Box pushing actions
    (:action push_left
        :parameters (?p - agent ?b - box ?player_pos ?box_pos ?target_pos - cell)
        :precondition (and
            (at_agent ?p ?player_pos)
            (at_box ?b ?box_pos)
            (adj_left ?player_pos ?box_pos)   ; Player is to the right of the box
            (adj_left ?box_pos ?target_pos)    ; Box target is to the left of the box
            (not (is_wall ?target_pos))
            (not (at_box ?b ?target_pos))      ; Target cannot be occupied by the box itself
        )
        :effect (and
            (not (at_agent ?p ?player_pos))
            (at_agent ?p ?box_pos)             ; Player moves to the box's original position
            (not (at_box ?b ?box_pos))
            (at_box ?b ?target_pos)            ; Box moves to the target position
        )
    )

    (:action push_right
        :parameters (?p - agent ?b - box ?player_pos ?box_pos ?target_pos - cell)
        :precondition (and
            (at_agent ?p ?player_pos)
            (at_box ?b ?box_pos)
            (adj_right ?player_pos ?box_pos)  ; Player is to the left of the box
            (adj_right ?box_pos ?target_pos)   ; Box target is to the right of the box
            (not (is_wall ?target_pos))
            (not (at_box ?b ?target_pos))      ; Target cannot be occupied by the box itself
        )
        :effect (and
            (not (at_agent ?p ?player_pos))
            (at_agent ?p ?box_pos)
            (not (at_box ?b ?box_pos))
            (at_box ?b ?target_pos)
        )
    )
)