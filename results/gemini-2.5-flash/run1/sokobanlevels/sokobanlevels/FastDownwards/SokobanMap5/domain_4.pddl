(define (domain sokobanmap5)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location
        player
        box
    )
    (:predicates
        (at_player ?p - player ?l - location)
        (at_box ?b - box ?l - location)
        (is_goal ?l - location)
        (is_wall ?l - location)
        (adj_up ?l1 ?l2 - location)
        (adj_down ?l1 ?l2 - location)
    )

    (:action move_player_up
        :parameters (?p - player ?from ?to - location)
        :precondition (and
            (at_player ?p ?from)
            (adj_up ?from ?to)
            (not (is_wall ?to))
            (not (at_box box1 ?to))
        )
        :effect (and
            (not (at_player ?p ?from))
            (at_player ?p ?to)
        )
    )

    (:action move_player_down
        :parameters (?p - player ?from ?to - location)
        :precondition (and
            (at_player ?p ?from)
            (adj_down ?from ?to)
            (not (is_wall ?to))
            (not (at_box box1 ?to))
        )
        :effect (and
            (not (at_player ?p ?from))
            (at_player ?p ?to)
        )
    )

    (:action push_box_up
        :parameters (?p - player ?b - box ?player_loc ?box_loc ?box_target - location)
        :precondition (and
            (at_player ?p ?player_loc)
            (at_box ?b ?box_loc)
            (adj_up ?player_loc ?box_loc)
            (adj_up ?box_loc ?box_target)
            (not (is_wall ?box_target))
            (not (at_box ?b ?box_target))
        )
        :effect (and
            (not (at_player ?p ?player_loc))
            (at_player ?p ?box_loc)
            (not (at_box ?b ?box_loc))
            (at_box ?b ?box_target)
        )
    )

    (:action push_box_down
        :parameters (?p - player ?b - box ?player_loc ?box_loc ?box_target - location)
        :precondition (and
            (at_player ?p ?player_loc)
            (at_box ?b ?box_loc)
            (adj_down ?player_loc ?box_loc)
            (adj_down ?box_loc ?box_target)
            (not (is_wall ?box_target))
            (not (at_box ?b ?box_target))
        )
        :effect (and
            (not (at_player ?p ?player_loc))
            (at_player ?p ?box_loc)
            (not (at_box ?b ?box_loc))
            (at_box ?b ?box_target)
        )
    )
)