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
        (connected ?l1 ?l2 ?dir - direction)
    )

    (:action move_player
        (:parameters ?from - location ?to - location ?dir - direction)
        (:precondition
            (and
                (at_player ?from)
                (connected ?from ?to ?dir)
                (is_clear ?to)
                (not (at_box b1 ?to)) ; The single box is named b1
            )
        )
        (:effect
            (and
                (not (at_player ?from))
                (at_player ?to)
            )
        )
    )

    (:action push_box
        (:parameters ?player_from - location ?box_from - location ?box_to - location ?dir - direction)
        (:precondition
            (and
                (at_player ?player_from)
                (at_box b1 ?box_from) ; The single box is named b1
                (connected ?player_from ?box_from ?dir) ; player is behind box
                (connected ?box_from ?box_to ?dir)     ; box can be pushed to box_to
                (is_clear ?box_to)
                (not (at_box b1 ?box_to)) ; box_to must be clear (not a wall, and not occupied by a box)
            )
        )
        (:effect
            (and
                (not (at_player ?player_from))
                (at_player ?box_from) ; player moves to box's old position
                (not (at_box b1 ?box_from))
                (at_box b1 ?box_to)
            )
        )
    )
)