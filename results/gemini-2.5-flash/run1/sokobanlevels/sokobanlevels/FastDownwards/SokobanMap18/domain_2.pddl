(define (domain sokobanmap18)
    (:requirements :strips :typing :negative-preconditions)
    (:types player box location)
    (:predicates
        (player_at ?p - player ?l - location)
        (box_at ?b - box ?l - location)
        (is_goal ?l - location)
        (is_wall ?l - location)
        (loc_up ?l1 ?l2 - location)
        (loc_down ?l1 ?l2 - location)
        (loc_left ?l1 ?l2 - location)
        (loc_right ?l1 ?l2 - location)
    )

    (:action move_up
        :parameters (?p - player ?from ?to - location)
        :precondition (and
            (player_at ?p ?from)
            (loc_up ?from ?to)
            (not (is_wall ?to))
            (not (box_at box1 ?to))
        )
        :effect (and
            (not (player_at ?p ?from))
            (player_at ?p ?to)
        )
    )

    (:action move_down
        :parameters (?p - player ?from ?to - location)
        :precondition (and
            (player_at ?p ?from)
            (loc_down ?from ?to)
            (not (is_wall ?to))
            (not (box_at box1 ?to))
        )
        :effect (and
            (not (player_at ?p ?from))
            (player_at ?p ?to)
        )
    )

    (:action move_left
        :parameters (?p - player ?from ?to - location)
        :precondition (and
            (player_at ?p ?from)
            (loc_left ?from ?to)
            (not (is_wall ?to))
            (not (box_at box1 ?to))
        )
        :effect (and
            (not (player_at ?p ?from))
            (player_at ?p ?to)
        )
    )

    (:action move_right
        :parameters (?p - player ?from ?to - location)
        :precondition (and
            (player_at ?p ?from)
            (loc_right ?from ?to)
            (not (is_wall ?to))
            (not (box_at box1 ?to))
        )
        :effect (and
            (not (player_at ?p ?from))
            (player_at ?p ?to)
        )
    )

    (:action push_box_up
        :parameters (?p - player ?b - box ?player_from ?box_from ?box_to - location)
        :precondition (and
            (player_at ?p ?player_from)
            (box_at ?b ?box_from)
            (loc_up ?player_from ?box_from)
            (loc_up ?box_from ?box_to)
            (not (is_wall ?box_to))
            (not (box_at box1 ?box_to))
            (not (player_at player1 ?box_to))
        )
        :effect (and
            (not (player_at ?p ?player_from))
            (player_at ?p ?box_from)
            (not (box_at ?b ?box_from))
            (box_at ?b ?box_to)
        )
    )

    (:action push_box_down
        :parameters (?p - player ?b - box ?player_from ?box_from ?box_to - location)
        :precondition (and
            (player_at ?p ?player_from)
            (box_at ?b ?box_from)
            (loc_down ?player_from ?box_from)
            (loc_down ?box_from ?box_to)
            (not (is_wall ?box_to))
            (not (box_at box1 ?box_to))
            (not (player_at player1 ?box_to))
        )
        :effect (and
            (not (player_at ?p ?player_from))
            (player_at ?p ?box_from)
            (not (box_at ?b ?box_from))
            (box_at ?b ?box_to)
        )
    )

    (:action push_box_left
        :parameters (?p - player ?b - box ?player_from ?box_from ?box_to - location)
        :precondition (and
            (player_at ?p ?player_from)
            (box_at ?b ?box_from)
            (loc_left ?player_from ?box_from)
            (loc_left ?box_from ?box_to)
            (not (is_wall ?box_to))
            (not (box_at box1 ?box_to))
            (not (player_at player1 ?box_to))
        )
        :effect (and
            (not (player_at ?p ?player_from))
            (player_at ?p ?box_from)
            (not (box_at ?b ?box_from))
            (box_at ?b ?box_to)
        )
    )

    (:action push_box_right
        :parameters (?p - player ?b - box ?player_from ?box_from ?box_to - location)
        :precondition (and
            (player_at ?p ?player_from)
            (box_at ?b ?box_from)
            (loc_right ?player_from ?box_from)
            (loc_right ?box_from ?box_to)
            (not (is_wall ?box_to))
            (not (box_at box1 ?box_to))
            (not (player_at player1 ?box_to))
        )
        :effect (and
            (not (player_at ?p ?player_from))
            (player_at ?p ?box_from)
            (not (box_at ?b ?box_from))
            (box_at ?b ?box_to)
        )
    )
)