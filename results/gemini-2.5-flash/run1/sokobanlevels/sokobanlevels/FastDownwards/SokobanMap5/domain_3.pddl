(define (domain sokobanmap5)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location
        player
        box
    )
    (:predicates
        (at_player ?p - player ?l - location)
        (at_box ?b - box ?l - location)
        (is_goal ?l - location)
        (is_wall ?l - location)
        (connected ?l1 ?l2 - location)
    )

    (:action move_up
        :parameters (?p - player ?b - box ?from ?to - location)
        :precondition (and
            (at_player ?p ?from)
            (connected ?from ?to) ; Original PDDL used (connected ?from ?to) for move_up, implying ?to is above ?from relative to ?from.
            (not (is_wall ?to))
            (not (at_box ?b ?to))
        )
        :effect (and
            (not (at_player ?p ?from))
            (at_player ?p ?to)
        )
    )

    (:action move_down
        :parameters (?p - player ?b - box ?from ?to - location)
        :precondition (and
            (at_player ?p ?from)
            (connected ?to ?from) ; Original PDDL used (connected ?to ?from) for move_down, implying ?to is below ?from relative to ?from.
            (not (is_wall ?to))
            (not (at_box ?b ?to))
        )
        :effect (and
            (not (at_player ?p ?from))
            (at_player ?p ?to)
        )
    )

    (:action push_box_up
        :parameters (?p - player ?b - box ?player_loc ?box_loc ?box_target - location)
        :precondition (and
            (at_player ?p ?player_loc)
            (at_box ?b ?box_loc)
            (connected ?box_loc ?player_loc) ; Player is directly below the box
            (connected ?box_target ?box_loc) ; Box target is directly above the box
            (not (is_wall ?box_target))
            (not (at_box ?b ?box_target))
        )
        :effect (and
            (not (at_player ?p ?player_loc))
            (at_player ?p ?box_loc)
            (not (at_box ?b ?box_loc))
            (at_box ?b ?box_target)
        )
    )

    (:action push_box_down
        :parameters (?p - player ?b - box ?player_loc ?box_loc ?box_target - location)
        :precondition (and
            (at_player ?p ?player_loc)
            (at_box ?b ?box_loc)
            (connected ?player_loc ?box_loc) ; Player is directly above the box
            (connected ?box_loc ?box_target) ; Box target is directly below the box
            (not (is_wall ?box_target))
            (not (at_box ?b ?box_target))
        )
        :effect (and
            (not (at_player ?p ?player_loc))
            (at_player ?p ?box_loc)
            (not (at_box ?b ?box_loc))
            (at_box ?b ?box_target)
        )
    )
)