(define (domain sokoban_map13)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        agent
        box
        location
    )
    (:predicates
        (at ?o - (either agent box) ?l - location) ; Fix: changed (or agent box) to (either agent box)
        (is_goal ?l - location)
        (is_wall ?l - location)
        (is_neighbor_up ?l1 ?l2 - location)
        (is_neighbor_down ?l1 ?l2 - location)
        (is_neighbor_left ?l1 ?l2 - location)
        (is_neighbor_right ?l1 ?l2 - location)
    )

    ; Player move actions
    (:action move_up
        :parameters (?p - agent ?from ?to - location)
        :precondition (and
            (at ?p ?from)
            (is_neighbor_up ?from ?to)
            (not (is_wall ?to))
            (not (at box_1 ?to))
        )
        :effect (and
            (not (at ?p ?from))
            (at ?p ?to)
        )
    )

    (:action move_down
        :parameters (?p - agent ?from ?to - location)
        :precondition (and
            (at ?p ?from)
            (is_neighbor_down ?from ?to)
            (not (is_wall ?to))
            (not (at box_1 ?to))
        )
        :effect (and
            (not (at ?p ?from))
            (at ?p ?to)
        )
    )

    (:action move_left
        :parameters (?p - agent ?from ?to - location)
        :precondition (and
            (at ?p ?from)
            (is_neighbor_left ?from ?to)
            (not (is_wall ?to))
            (not (at box_1 ?to))
        )
        :effect (and
            (not (at ?p ?from))
            (at ?p ?to)
        )
    )

    (:action move_right
        :parameters (?p - agent ?from ?to - location)
        :precondition (and
            (at ?p ?from)
            (is_neighbor_right ?from ?to)
            (not (is_wall ?to))
            (not (at box_1 ?to))
        )
        :effect (and
            (not (at ?p ?from))
            (at ?p ?to)
        )
    )

    ; Push actions
    (:action push_up
        :parameters (?p - agent ?box - box ?player_pos ?box_pos ?new_box_pos - location)
        :precondition (and
            (at ?p ?player_pos)
            (at ?box ?box_pos)
            (is_neighbor_down ?box_pos ?player_pos) ; Player is below the box
            (is_neighbor_up ?box_pos ?new_box_pos) ; New box position is above the box
            (not (is_wall ?new_box_pos))
            ;(not (at box_1 ?new_box_pos)) ; Removed: redundant for single box, as box_1 is at box_pos
        )
        :effect (and
            (not (at ?p ?player_pos))
            (not (at ?box ?box_pos))
            (at ?p ?box_pos) ; Player moves to where the box was
            (at ?box ?new_box_pos) ; Box moves to target
        )
    )

    (:action push_down
        :parameters (?p - agent ?box - box ?player_pos ?box_pos ?new_box_pos - location)
        :precondition (and
            (at ?p ?player_pos)
            (at ?box ?box_pos)
            (is_neighbor_up ?box_pos ?player_pos) ; Player is above the box
            (is_neighbor_down ?box_pos ?new_box_pos) ; New box position is below the box
            (not (is_wall ?new_box_pos))
            ;(not (at box_1 ?new_box_pos)) ; Removed: redundant for single box
        )
        :effect (and
            (not (at ?p ?player_pos))
            (not (at ?box ?box_pos))
            (at ?p ?box_pos)
            (at ?box ?new_box_pos)
        )
    )

    (:action push_left
        :parameters (?p - agent ?box - box ?player_pos ?box_pos ?new_box_pos - location)
        :precondition (and
            (at ?p ?player_pos)
            (at ?box ?box_pos)
            (is_neighbor_right ?box_pos ?player_pos) ; Player is to the right of the box
            (is_neighbor_left ?box_pos ?new_box_pos) ; New box position is to the left of the box
            (not (is_wall ?new_box_pos))
            ;(not (at box_1 ?new_box_pos)) ; Removed: redundant for single box
        )
        :effect (and
            (not (at ?p ?player_pos))
            (not (at ?box ?box_pos))
            (at ?p ?box_pos)
            (at ?box ?new_box_pos)
        )
    )

    (:action push_right
        :parameters (?p - agent ?box - box ?player_pos ?box_pos ?new_box_pos - location)
        :precondition (and
            (at ?p ?player_pos)
            (at ?box ?box_pos)
            (is_neighbor_left ?box_pos ?player_pos) ; Player is to the left of the box
            (is_neighbor_right ?box_pos ?new_box_pos) ; New box position is to the right of the box
            (not (is_wall ?new_box_pos))
            ;(not (at box_1 ?new_box_pos)) ; Removed: redundant for single box
        )
        :effect (and
            (not (at ?p ?player_pos))
            (not (at ?box ?box_pos))
            (at ?p ?box_pos)
            (at ?box ?new_box_pos)
        )
    )
)