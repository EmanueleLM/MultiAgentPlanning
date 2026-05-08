(define (domain sokoban_map4)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location
        direction
        box_type
    )
    (:predicates
        (at_player ?l - location)
        (at_box ?b - box_type ?l - location)
        (is_goal ?l - location)
        (is_wall ?l - location)
        (is_clear ?l - location) ; indicates a non-wall location that can be traversed/pushed into
        (connected ?l1 - location ?l2 - location ?dir - direction)
    )

    (:action move_player_up
        :parameters (?from - location ?to - location)
        :precondition
            (and
                (at_player ?from)
                (connected ?from ?to up)
                (is_clear ?to)
                (not (at_box b1 ?to))
            )
        :effect
            (and
                (not (at_player ?from))
                (at_player ?to)
            )
    )

    (:action move_player_down
        :parameters (?from - location ?to - location)
        :precondition
            (and
                (at_player ?from)
                (connected ?from ?to down)
                (is_clear ?to)
                (not (at_box b1 ?to))
            )
        :effect
            (and
                (not (at_player ?from))
                (at_player ?to)
            )
    )

    (:action push_box_up
        :parameters (?player_from - location ?box_from - location ?box_to - location)
        :precondition
            (and
                (at_player ?player_from)
                (at_box b1 ?box_from)
                (connected ?player_from ?box_from up) ; player is behind box (below it)
                (connected ?box_from ?box_to up)     ; box can be pushed up
                (is_clear ?box_to)
                (not (at_box b1 ?box_to))
            )
        :effect
            (and
                (not (at_player ?player_from))
                (at_player ?box_from) ; player moves to box's old position
                (not (at_box b1 ?box_from))
                (at_box b1 ?box_to)
            )
    )

    (:action push_box_down
        :parameters (?player_from - location ?box_from - location ?box_to - location)
        :precondition
            (and
                (at_player ?player_from)
                (at_box b1 ?box_from)
                (connected ?player_from ?box_from down) ; player is behind box (above it)
                (connected ?box_from ?box_to down)     ; box can be pushed down
                (is_clear ?box_to)
                (not (at_box b1 ?box_to))
            )
        :effect
            (and
                (not (at_player ?player_from))
                (at_player ?box_from) ; player moves to box's old position
                (not (at_box b1 ?box_from))
                (at_box b1 ?box_to)
            )
    )
)