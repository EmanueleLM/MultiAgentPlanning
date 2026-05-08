(define (domain sokoban-map48)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location
        agent
        item
    )
    (:predicates
        (at_player ?l - location)
        (at_box ?l - location)
        (is_goal ?l - location)
        (is_wall ?l - location)
        (connected_left ?l1 ?l2 - location) ; ?l2 is to the left of ?l1 (so l1 can move left to l2)
        (connected_right ?l1 ?l2 - location) ; ?l2 is to the right of ?l1 (so l1 can move right to l2)
        (connected_up ?l1 ?l2 - location)   ; ?l2 is above ?l1 (so l1 can move up to l2)
        (connected_down ?l1 ?l2 - location) ; ?l2 is below ?l1 (so l1 can move down to l2)
    )

    ; Player move actions
    (:action move_left
        :parameters (?from - location ?to - location)
        :precondition (and
            (at_player ?from)
            (connected_left ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
        )
    )

    (:action move_right
        :parameters (?from - location ?to - location)
        :precondition (and
            (at_player ?from)
            (connected_right ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
        )
    )

    (:action move_up
        :parameters (?from - location ?to - location)
        :precondition (and
            (at_player ?from)
            (connected_up ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
        )
    )

    (:action move_down
        :parameters (?from - location ?to - location)
        :precondition (and
            (at_player ?from)
            (connected_down ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
        )
    )

    ; Box push actions
    (:action push_box_left
        :parameters (?player_from - location ?box_from - location ?box_to - location)
        :precondition (and
            (at_player ?player_from)
            (at_box ?box_from)
            (connected_left ?player_from ?box_from) ; Player is RIGHT of box (?box_from is left of ?player_from), pushing left
            (connected_left ?box_from ?box_to)       ; Box moves left to box_to
            (not (is_wall ?box_to))
            (not (at_box ?box_to))
        )
        :effect (and
            (not (at_player ?player_from))
            (at_player ?box_from) ; Player moves to box's previous spot
            (not (at_box ?box_from))
            (at_box ?box_to)
        )
    )

    (:action push_box_right
        :parameters (?player_from - location ?box_from - location ?box_to - location)
        :precondition (and
            (at_player ?player_from)
            (at_box ?box_from)
            (connected_right ?player_from ?box_from) ; Player is LEFT of box (?box_from is right of ?player_from), pushing right
            (connected_right ?box_from ?box_to)      ; Box moves right to box_to
            (not (is_wall ?box_to))
            (not (at_box ?box_to))
        )
        :effect (and
            (not (at_player ?player_from))
            (at_player ?box_from) ; Player moves to box's previous spot
            (not (at_box ?box_from))
            (at_box ?box_to)
        )
    )

    (:action push_box_up
        :parameters (?player_from - location ?box_from - location ?box_to - location)
        :precondition (and
            (at_player ?player_from)
            (at_box ?box_from)
            (connected_up ?player_from ?box_from) ; Player is BELOW box (?box_from is above ?player_from), pushing up
            (connected_up ?box_from ?box_to)         ; Box moves up to box_to
            (not (is_wall ?box_to))
            (not (at_box ?box_to))
        )
        :effect (and
            (not (at_player ?player_from))
            (at_player ?box_from) ; Player moves to box's previous spot
            (not (at_box ?box_from))
            (at_box ?box_to)
        )
    )

    (:action push_box_down
        :parameters (?player_from - location ?box_from - location ?box_to - location)
        :precondition (and
            (at_player ?player_from)
            (at_box ?box_from)
            (connected_down ?player_from ?box_from) ; Player is ABOVE box (?box_from is below ?player_from), pushing down
            (connected_down ?box_from ?box_to)       ; Box moves down to box_to
            (not (is_wall ?box_to))
            (not (at_box ?box_to))
        )
        :effect (and
            (not (at_player ?player_from))
            (at_player ?box_from) ; Player moves to box's previous spot
            (not (at_box ?box_from))
            (at_box ?box_to)
        )
    )
)