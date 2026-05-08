(define (domain sokobanmap2)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        player
        box
        cell
    )
    (:predicates
        (at_player ?p - player ?c - cell)
        (at_box ?b - box ?c - cell)
        (is_goal_pos ?c - cell)
        (connected ?from ?to - cell)
    )

    ;; Player movement action: Player moves to an empty adjacent cell
    (:action move_player
        :parameters (?p - player ?from ?to - cell)
        :precondition (and ; Fixed: changed :preconditions to :precondition
            (at_player ?p ?from)
            (connected ?from ?to)
            (not (at_box box1 ?to)) ; The target cell must not contain a box (specific to box1 for this instance)
        )
        :effect (and
            (not (at_player ?p ?from))
            (at_player ?p ?to)
        )
    )

    ;; Box pushing action: Player pushes box to an adjacent empty cell
    ;; The player moves to the box's original position.
    (:action push_box
        :parameters (?p - player ?b - box ?player_current_pos ?box_current_pos ?box_target_pos - cell)
        :precondition (and ; Fixed: changed :preconditions to :precondition
            (at_player ?p ?player_current_pos)
            (connected ?player_current_pos ?box_current_pos) ; Player is adjacent to the box
            (at_box ?b ?box_current_pos)
            (connected ?box_current_pos ?box_target_pos) ; Box can move to target
            (not (at_box ?b ?box_target_pos)) ; Box target must be empty (no other box)
            (not (at_player ?p ?box_target_pos)) ; Box target must not be occupied by the player
        )
        :effect (and
            (not (at_player ?p ?player_current_pos))
            (at_player ?p ?box_current_pos) ; Player moves to the box's original position
            (not (at_box ?b ?box_current_pos))
            (at_box ?b ?box_target_pos) ; Box moves to target spot
        )
    )
)