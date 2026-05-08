(define (domain sokobanmap5)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location
        player
        box
    )
    (:predicates
        (at_player ?l - location)
        (at_box ?b - box ?l - location)
        (is_goal ?l - location)
        (is_wall ?l - location)
        (connected ?l1 ?l2 - location)
    )

    (:action move_up
        :parameters (?from ?to - location)
        :precondition (and
            (at_player ?from)
            (connected ?from ?to)
            (not (is_wall ?to))
            (not (at_box box1 ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
        )
    )

    (:action move_down
        :parameters (?from ?to - location)
        :precondition (and
            (at_player ?from)
            (connected ?to ?from)
            (not (is_wall ?to))
            (not (at_box box1 ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
        )
    )

    (:action push_box_up
        :parameters (?player_loc ?box_loc ?box_target - location)
        :precondition (and
            (at_player ?player_loc)
            (at_box box1 ?box_loc)
            (connected ?player_loc ?box_loc)
            (connected ?box_loc ?box_target)
            (not (is_wall ?box_target))
            (not (at_box box1 ?box_target))
        )
        :effect (and
            (not (at_player ?player_loc))
            (at_player ?box_loc)
            (not (at_box box1 ?box_loc))
            (at_box box1 ?box_target)
        )
    )

    (:action push_box_down
        :parameters (?player_loc ?box_loc ?box_target - location)
        :precondition (and
            (at_player ?player_loc)
            (at_box box1 ?box_loc)
            (connected ?box_loc ?player_loc)
            (connected ?box_target ?box_loc)
            (not (is_wall ?box_target))
            (not (at_box box1 ?box_target))
        )
        :effect (and
            (not (at_player ?player_loc))
            (at_player ?box_loc)
            (not (at_box box1 ?box_loc))
            (at_box box1 ?box_target)
        )
    )
)