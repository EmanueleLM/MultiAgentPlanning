(define (domain sokoban-map27)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        location - object
        player - object
        box - object
    )
    (:predicates
        (at_player ?l - location)
        (at_box ?l - location)
        (is_goal ?l - location)
        (is_wall ?l - location)
        (connected ?l1 ?l2 - location)
    )
    (:functions
        (total-cost) - number
    )
    (:action move_player
        :parameters (?from ?to - location)
        :precondition (and
            (at_player ?from)
            (connected ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
            (increase (total-cost) 1)
        )
    )

    (:action push_box
        :parameters (?player_loc ?box_loc ?new_box_loc - location)
        :precondition (and
            (at_player ?player_loc)
            (at_box ?box_loc)
            (connected ?player_loc ?box_loc)
            (connected ?box_loc ?new_box_loc)
            (not (is_wall ?new_box_loc))
            (not (at_box ?new_box_loc))
        )
        :effect (and
            (not (at_player ?player_loc))
            (at_player ?box_loc) ; Player moves to the box's previous location
            (not (at_box ?box_loc))
            (at_box ?new_box_loc)
            (increase (total-cost) 1)
        )
    )
)