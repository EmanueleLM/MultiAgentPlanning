(define (domain sokobanmap6)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        player
        box
        location
    )
    (:predicates
        (at_player ?p - player ?l - location)
        (at_box ?b - box ?l - location)
        (is_goal ?l - location)
        (is_wall ?l - location)
        (connected_left ?l1 - location ?l2 - location)
        (connected_right ?l1 - location ?l2 - location)
        (connected_up ?l1 - location ?l2 - location)
        (connected_down ?l1 - location ?l2 - location)
    )

    ;; Player moves to an empty adjacent space
    (:action move_player_left
        :parameters (?p - player ?b - box ?from - location ?to - location)
        :precondition (and
            (at_player ?p ?from)
            (connected_left ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?b ?to))
        )
        :effect (and
            (not (at_player ?p ?from))
            (at_player ?p ?to)
        )
    )

    (:action move_player_right
        :parameters (?p - player ?b - box ?from - location ?to - location)
        :precondition (and
            (at_player ?p ?from)
            (connected_right ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?b ?to))
        )
        :effect (and
            (not (at_player ?p ?from))
            (at_player ?p ?to)
        )
    )

    (:action move_player_up
        :parameters (?p - player ?b - box ?from - location ?to - location)
        :precondition (and
            (at_player ?p ?from)
            (connected_up ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?b ?to))
        )
        :effect (and
            (not (at_player ?p ?from))
            (at_player ?p ?to)
        )
    )

    (:action move_player_down
        :parameters (?p - player ?b - box ?from - location ?to - location)
        :precondition (and
            (at_player ?p ?from)
            (connected_down ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?b ?to))
        )
        :effect (and
            (not (at_player ?p ?from))
            (at_player ?p ?to)
        )
    )

    ;; Player pushes a box to an adjacent empty space
    (:action push_box_left
        :parameters (?p - player ?b - box ?p_from - location ?b_from - location ?b_to - location)
        :precondition (and
            (at_player ?p ?p_from)
            (at_box ?b ?b_from)
            (connected_left ?p_from ?b_from) ; Player is right of box (b_from is left of p_from)
            (connected_left ?b_from ?b_to)    ; Box moves left
            (not (is_wall ?b_to))
            (not (at_box ?b ?b_to))
        )
        :effect (and
            (not (at_player ?p ?p_from))
            (at_player ?p ?b_from) ; Player moves to box's old spot
            (not (at_box ?b ?b_from))
            (at_box ?b ?b_to)
        )
    )

    (:action push_box_right
        :parameters (?p - player ?b - box ?p_from - location ?b_from - location ?b_to - location)
        :precondition (and
            (at_player ?p ?p_from)
            (at_box ?b ?b_from)
            (connected_right ?p_from ?b_from) ; Player is left of box (b_from is right of p_from)
            (connected_right ?b_from ?b_to)   ; Box moves right
            (not (is_wall ?b_to))
            (not (at_box ?b ?b_to))
        )
        :effect (and
            (not (at_player ?p ?p_from))
            (at_player ?p ?b_from)
            (not (at_box ?b ?b_from))
            (at_box ?b ?b_to)
        )
    )

    (:action push_box_up
        :parameters (?p - player ?b - box ?p_from - location ?b_from - location ?b_to - location)
        :precondition (and
            (at_player ?p ?p_from)
            (at_box ?b ?b_from)
            (connected_up ?p_from ?b_from)    ; Player is below box (b_from is above p_from)
            (connected_up ?b_from ?b_to)      ; Box moves up
            (not (is_wall ?b_to))
            (not (at_box ?b ?b_to))
        )
        :effect (and
            (not (at_player ?p ?p_from))
            (at_player ?p ?b_from)
            (not (at_box ?b ?b_from))
            (at_box ?b ?b_to)
        )
    )

    (:action push_box_down
        :parameters (?p - player ?b - box ?p_from - location ?b_from - location ?b_to - location)
        :precondition (and
            (at_player ?p ?p_from)
            (at_box ?b ?b_from)
            (connected_down ?p_from ?b_from)  ; Player is above box (b_from is below p_from)
            (connected_down ?b_from ?b_to)    ; Box moves down
            (not (is_wall ?b_to))
            (not (at_box ?b ?b_to))
        )
        :effect (and
            (not (at_player ?p ?p_from))
            (at_player ?p ?b_from)
            (not (at_box ?b ?b_from))
            (at_box ?b ?b_to)
        )
    )
)