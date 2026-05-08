(define (domain sokobanmap49)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        agent
        item
        location
    )
    (:predicates
        (at_player ?l - location)
        (at_box ?l - location)
        (is_goal ?l - location)
        (is_wall ?l - location)
        (left_of ?l1 ?l2 - location)
        (right_of ?l1 ?l2 - location)
        (up_of ?l1 ?l2 - location)
        (down_of ?l1 ?l2 - location)
    )

    (:action move_left
        :parameters (?player_from - location ?player_to - location)
        :precondition (and
            (at_player ?player_from)
            (left_of ?player_to ?player_from)
            (not (is_wall ?player_to))
            (not (at_box ?player_to))
        )
        :effect (and
            (not (at_player ?player_from))
            (at_player ?player_to)
        )
    )

    (:action move_right
        :parameters (?player_from - location ?player_to - location)
        :precondition (and
            (at_player ?player_from)
            (right_of ?player_to ?player_from)
            (not (is_wall ?player_to))
            (not (at_box ?player_to))
        )
        :effect (and
            (not (at_player ?player_from))
            (at_player ?player_to)
        )
    )

    (:action move_up
        :parameters (?player_from - location ?player_to - location)
        :precondition (and
            (at_player ?player_from)
            (up_of ?player_to ?player_from)
            (not (is_wall ?player_to))
            (not (at_box ?player_to))
        )
        :effect (and
            (not (at_player ?player_from))
            (at_player ?player_to)
        )
    )

    (:action move_down
        :parameters (?player_from - location ?player_to - location)
        :precondition (and
            (at_player ?player_from)
            (down_of ?player_to ?player_from)
            (not (is_wall ?player_to))
            (not (at_box ?player_to))
        )
        :effect (and
            (not (at_player ?player_from))
            (at_player ?player_to)
        )
    )

    (:action push_left
        :parameters (?player_from - location ?box_from - location ?box_to - location)
        :precondition (and
            (at_player ?player_from)
            (at_box ?box_from)
            (left_of ?box_from ?player_from) ; Player is to the right of the box
            (left_of ?box_to ?box_from)     ; Box destination is to the left of box current
            (not (is_wall ?box_to))
            (not (at_box ?box_to))          ; Box destination must be empty of other boxes
        )
        :effect (and
            (not (at_player ?player_from))
            (at_player ?box_from)           ; Player moves to box's previous position
            (not (at_box ?box_from))
            (at_box ?box_to)
        )
    )

    (:action push_right
        :parameters (?player_from - location ?box_from - location ?box_to - location)
        :precondition (and
            (at_player ?player_from)
            (at_box ?box_from)
            (right_of ?box_from ?player_from) ; Player is to the left of the box
            (right_of ?box_to ?box_from)      ; Box destination is to the right of box current
            (not (is_wall ?box_to))
            (not (at_box ?box_to))
        )
        :effect (and
            (not (at_player ?player_from))
            (at_player ?box_from)
            (not (at_box ?box_from))
            (at_box ?box_to)
        )
    )

    (:action push_up
        :parameters (?player_from - location ?box_from - location ?box_to - location)
        :precondition (and
            (at_player ?player_from)
            (at_box ?box_from)
            (up_of ?box_from ?player_from) ; Player is below the box
            (up_of ?box_to ?box_from)      ; Box destination is above box current
            (not (is_wall ?box_to))
            (not (at_box ?box_to))
        )
        :effect (and
            (not (at_player ?player_from))
            (at_player ?box_from)
            (not (at_box ?box_from))
            (at_box ?box_to)
        )
    )

    (:action push_down
        :parameters (?player_from - location ?box_from - location ?box_to - location)
        :precondition (and
            (at_player ?player_from)
            (at_box ?box_from)
            (down_of ?box_from ?player_from) ; Player is above the box
            (down_of ?box_to ?box_from)      ; Box destination is below box current
            (not (is_wall ?box_to))
            (not (at_box ?box_to))
        )
        :effect (and
            (not (at_player ?player_from))
            (at_player ?box_from)
            (not (at_box ?box_from))
            (at_box ?box_to)
        )
    )
)