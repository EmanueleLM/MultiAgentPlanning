(define (domain sokobanmap40)
    (:requirements :strips :typing :negative-preconditions)
    (:types location)
    (:predicates
        (at_player ?l - location)
        (at_box ?l - location)
        (is_goal ?l - location)
        (wall ?l - location)
        (adj_left ?l1 ?l2 - location)
        (adj_right ?l1 ?l2 - location)
        (adj_up ?l1 ?l2 - location)
        (adj_down ?l1 ?l2 - location)
    )

    ;; Player movement actions
    (:action move_player_left
        :parameters (?from ?to - location)
        :precondition (and
            (at_player ?from)
            (adj_left ?from ?to)
            (not (wall ?to))
            (not (at_box ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
        )
    )

    (:action move_player_right
        :parameters (?from ?to - location)
        :precondition (and
            (at_player ?from)
            (adj_right ?from ?to)
            (not (wall ?to))
            (not (at_box ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
        )
    )

    (:action move_player_up
        :parameters (?from ?to - location)
        :precondition (and
            (at_player ?from)
            (adj_up ?from ?to)
            (not (wall ?to))
            (not (at_box ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
        )
    )

    (:action move_player_down
        :parameters (?from ?to - location)
        :precondition (and
            (at_player ?from)
            (adj_down ?from ?to)
            (not (wall ?to))
            (not (at_box ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
        )
    )

    ;; Box pushing actions
    (:action push_box_left
        :parameters (?p_from ?b_from ?b_to - location)
        :precondition (and
            (at_player ?p_from)
            (at_box ?b_from)
            (adj_right ?b_from ?p_from) ; Player is to the right of the box
            (adj_left ?b_from ?b_to)    ; Box moves left
            (not (wall ?b_to))
            (not (at_box ?b_to))
        )
        :effect (and
            (not (at_player ?p_from))
            (at_player ?b_from) ; Player moves to the box's original position
            (not (at_box ?b_from))
            (at_box ?b_to)
        )
    )

    (:action push_box_right
        :parameters (?p_from ?b_from ?b_to - location)
        :precondition (and
            (at_player ?p_from)
            (at_box ?b_from)
            (adj_left ?b_from ?p_from) ; Player is to the left of the box
            (adj_right ?b_from ?b_to)   ; Box moves right
            (not (wall ?b_to))
            (not (at_box ?b_to))
        )
        :effect (and
            (not (at_player ?p_from))
            (at_player ?b_from)
            (not (at_box ?b_from))
            (at_box ?b_to)
        )
    )

    (:action push_box_up
        :parameters (?p_from ?b_from ?b_to - location)
        :precondition (and
            (at_player ?p_from)
            (at_box ?b_from)
            (adj_down ?b_from ?p_from) ; Player is below the box
            (adj_up ?b_from ?b_to)     ; Box moves up
            (not (wall ?b_to))
            (not (at_box ?b_to))
        )
        :effect (and
            (not (at_player ?p_from))
            (at_player ?b_from)
            (not (at_box ?b_from))
            (at_box ?b_to)
        )
    )

    (:action push_box_down
        :parameters (?p_from ?b_from ?b_to - location)
        :precondition (and
            (at_player ?p_from)
            (at_box ?b_from)
            (adj_up ?b_from ?p_from)   ; Player is above the box
            (adj_down ?b_from ?b_to)   ; Box moves down
            (not (wall ?b_to))
            (not (at_box ?b_to))
        )
        :effect (and
            (not (at_player ?p_from))
            (at_player ?b_from)
            (not (at_box ?b_from))
            (at_box ?b_to)
        )
    )
)