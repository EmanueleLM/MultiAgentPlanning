(define (domain sokobanmap18)
    (:requirements :strips :typing :negative-preconditions)
    (:types player box location)
    (:predicates
        (at_player ?l - location) ; Unary predicate for the single player's location
        (at_box ?l - location)   ; Unary predicate for the single box's location
        (is_goal ?l - location)
        (is_wall ?l - location)
        (loc_up ?l1 ?l2 - location)
        (loc_down ?l1 ?l2 - location)
        (loc_left ?l1 ?l2 - location)
        (loc_right ?l1 ?l2 - location)
    )

    (:action move_up
        :parameters (?from ?to - location)
        :precondition (and
            (at_player ?from)
            (loc_up ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?to))
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
            (loc_down ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
        )
    )

    (:action move_left
        :parameters (?from ?to - location)
        :precondition (and
            (at_player ?from)
            (loc_left ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
        )
    )

    (:action move_right
        :parameters (?from ?to - location)
        :precondition (and
            (at_player ?from)
            (loc_right ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
        )
    )

    (:action push_box_up
        :parameters (?player_from ?box_from ?box_to - location)
        :precondition (and
            (at_player ?player_from)
            (at_box ?box_from)
            (loc_up ?player_from ?box_from)
            (loc_up ?box_from ?box_to)
            (not (is_wall ?box_to))
            (not (at_box ?box_to))
            (not (at_player ?box_to))
        )
        :effect (and
            (not (at_player ?player_from))
            (at_player ?box_from)
            (not (at_box ?box_from))
            (at_box ?box_to)
        )
    )

    (:action push_box_down
        :parameters (?player_from ?box_from ?box_to - location)
        :precondition (and
            (at_player ?player_from)
            (at_box ?box_from)
            (loc_down ?player_from ?box_from)
            (loc_down ?box_from ?box_to)
            (not (is_wall ?box_to))
            (not (at_box ?box_to))
            (not (at_player ?box_to))
        )
        :effect (and
            (not (at_player ?player_from))
            (at_player ?box_from)
            (not (at_box ?box_from))
            (at_box ?box_to)
        )
    )

    (:action push_box_left
        :parameters (?player_from ?box_from ?box_to - location)
        :precondition (and
            (at_player ?player_from)
            (at_box ?box_from)
            (loc_left ?player_from ?box_from)
            (loc_left ?box_from ?box_to)
            (not (is_wall ?box_to))
            (not (at_box ?box_to))
            (not (at_player ?box_to))
        )
        :effect (and
            (not (at_player ?player_from))
            (at_player ?box_from)
            (not (at_box ?box_from))
            (at_box ?box_to)
        )
    )

    (:action push_box_right
        :parameters (?player_from ?box_from ?box_to - location)
        :precondition (and
            (at_player ?player_from)
            (at_box ?box_from)
            (loc_right ?player_from ?box_from)
            (loc_right ?box_from ?box_to)
            (not (is_wall ?box_to))
            (not (at_box ?box_to))
            (not (at_player ?box_to))
        )
        :effect (and
            (not (at_player ?player_from))
            (at_player ?box_from)
            (not (at_box ?box_from))
            (at_box ?box_to)
        )
    )
)