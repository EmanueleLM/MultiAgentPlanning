(define (domain sokoban-map19)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        location
        direction
    )
    (:predicates
        (at_player ?l - location)
        (at_box ?l - location)
        (is_goal ?l - location)
        (is_wall ?l - location)
        (connected ?l1 ?l2 - location ?d - direction)
    )
    (:functions
        (total-cost)
    )

    (:action move-player
        :parameters (?from ?to - location ?d - direction)
        :precondition (and
            (at_player ?from)
            (connected ?from ?to ?d)
            (not (at_box ?to))
            (not (is_wall ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
            (increase (total-cost) 1)
        )
    )

    (:action push-box
        :parameters (?player_from ?box_from ?box_to - location ?d - direction)
        :precondition (and
            (at_player ?player_from)
            (at_box ?box_from)
            (connected ?player_from ?box_from ?d)
            (connected ?box_from ?box_to ?d)
            (not (is_wall ?box_to))
            (not (at_box ?box_to))
        )
        :effect (and
            (not (at_player ?player_from))
            (at_player ?box_from) ; Player moves to where the box was
            (not (at_box ?box_from))
            (at_box ?box_to)     ; Box moves to new position
            (increase (total-cost) 1)
        )
    )
)