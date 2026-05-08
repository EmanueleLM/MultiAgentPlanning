(define (domain sokoban_map47)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location
        agent
        box
    )
    (:predicates
        (at_player ?l - location)
        (at_box ?l - location)
        (is_goal ?l - location)
        (is_wall ?l - location)
        (clear ?l - location) ; True if location is not occupied by player or box and is not a wall.
        (left_of ?l1 ?l2 - location) ; ?l1 is to the immediate left of ?l2
        (right_of ?l1 ?l2 - location) ; ?l1 is to the immediate right of ?l2
    )

    (:action move_left
        :parameters (?current ?next - location)
        :precondition (and
            (at_player ?current)
            (left_of ?next ?current)
            (clear ?next)
        )
        :effect (and
            (not (at_player ?current))
            (at_player ?next)
            (not (clear ?next))
            (clear ?current)
        )
    )

    (:action move_right
        :parameters (?current ?next - location)
        :precondition (and
            (at_player ?current)
            (right_of ?next ?current)
            (clear ?next)
        )
        :effect (and
            (not (at_player ?current))
            (at_player ?next)
            (not (clear ?next))
            (clear ?current)
        )
    )

    (:action push_box_left
        :parameters (?player_from ?box_from ?box_to - location)
        :precondition (and
            (at_player ?player_from)
            (at_box ?box_from)
            (right_of ?player_from ?box_from) ; Player is to the right of the box
            (left_of ?box_to ?box_from)    ; Box target is to the left of the box
            (clear ?box_to)
        )
        :effect (and
            (not (at_player ?player_from))
            (at_player ?box_from) ; Player moves to where the box was
            (not (at_box ?box_from))
            (at_box ?box_to)
            (clear ?player_from) ; Player's old spot is now clear
            (not (clear ?box_to)) ; Box's new spot is no longer clear
        )
    )

    (:action push_box_right
        :parameters (?player_from ?box_from ?box_to - location)
        :precondition (and
            (at_player ?player_from)
            (at_box ?box_from)
            (left_of ?player_from ?box_from) ; Player is to the left of the box
            (right_of ?box_to ?box_from)   ; Box target is to the right of the box
            (clear ?box_to)
        )
        :effect (and
            (not (at_player ?player_from))
            (at_player ?box_from) ; Player moves to where the box was
            (not (at_box ?box_from))
            (at_box ?box_to)
            (clear ?player_from) ; Player's old spot is now clear
            (not (clear ?box_to)) ; Box's new spot is no longer clear
        )
    )
)