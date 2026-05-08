(define (domain sokoban-map34)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location
        agent
        item
    )
    (:predicates
        (at ?obj - (item agent) ?loc - location)
        (is_goal ?loc - location)
        (is_wall ?loc - location)
        (connected_left ?from ?to - location)
        (connected_right ?from ?to - location)
        (connected_up ?from ?to - location)
        (connected_down ?from ?to - location)
    )

    (:action move_left
        :parameters (?p - agent ?from ?to - location)
        :precondition (and
            (at ?p ?from)
            (connected_left ?from ?to)
            (not (is_wall ?to))
            (not (at box_1 ?to))
        )
        :effect (and
            (not (at ?p ?from))
            (at ?p ?to)
        )
    )

    (:action move_right
        :parameters (?p - agent ?from ?to - location)
        :precondition (and
            (at ?p ?from)
            (connected_right ?from ?to)
            (not (is_wall ?to))
            (not (at box_1 ?to))
        )
        :effect (and
            (not (at ?p ?from))
            (at ?p ?to)
        )
    )

    (:action move_up
        :parameters (?p - agent ?from ?to - location)
        :precondition (and
            (at ?p ?from)
            (connected_up ?from ?to)
            (not (is_wall ?to))
            (not (at box_1 ?to))
        )
        :effect (and
            (not (at ?p ?from))
            (at ?p ?to)
        )
    )

    (:action move_down
        :parameters (?p - agent ?from ?to - location)
        :precondition (and
            (at ?p ?from)
            (connected_down ?from ?to)
            (not (is_wall ?to))
            (not (at box_1 ?to))
        )
        :effect (and
            (not (at ?p ?from))
            (at ?p ?to)
        )
    )

    (:action push_left
        :parameters (?p - agent ?b - item ?player_loc ?box_loc ?new_box_loc - location)
        :precondition (and
            (at ?p ?player_loc)
            (at ?b ?box_loc)
            (connected_left ?box_loc ?new_box_loc)
            (connected_left ?player_loc ?box_loc)
            (not (is_wall ?new_box_loc))
            (not (at ?p ?new_box_loc))
        )
        :effect (and
            (not (at ?p ?player_loc))
            (at ?p ?box_loc)
            (not (at ?b ?box_loc))
            (at ?b ?new_box_loc)
        )
    )

    (:action push_right
        :parameters (?p - agent ?b - item ?player_loc ?box_loc ?new_box_loc - location)
        :precondition (and
            (at ?p ?player_loc)
            (at ?b ?box_loc)
            (connected_right ?box_loc ?new_box_loc)
            (connected_right ?player_loc ?box_loc)
            (not (is_wall ?new_box_loc))
            (not (at ?p ?new_box_loc))
        )
        :effect (and
            (not (at ?p ?player_loc))
            (at ?p ?box_loc)
            (not (at ?b ?box_loc))
            (at ?b ?new_box_loc)
        )
    )

    (:action push_up
        :parameters (?p - agent ?b - item ?player_loc ?box_loc ?new_box_loc - location)
        :precondition (and
            (at ?p ?player_loc)
            (at ?b ?box_loc)
            (connected_up ?box_loc ?new_box_loc)
            (connected_up ?player_loc ?box_loc)
            (not (is_wall ?new_box_loc))
            (not (at ?p ?new_box_loc))
        )
        :effect (and
            (not (at ?p ?player_loc))
            (at ?p ?box_loc)
            (not (at ?b ?box_loc))
            (at ?b ?new_box_loc)
        )
    )

    (:action push_down
        :parameters (?p - agent ?b - item ?player_loc ?box_loc ?new_box_loc - location)
        :precondition (and
            (at ?p ?player_loc)
            (at ?b ?box_loc)
            (connected_down ?box_loc ?new_box_loc)
            (connected_down ?player_loc ?box_loc)
            (not (is_wall ?new_box_loc))
            (not (at ?p ?new_box_loc))
        )
        :effect (and
            (not (at ?p ?player_loc))
            (at ?p ?box_loc)
            (not (at ?b ?box_loc))
            (at ?b ?new_box_loc)
        )
    )
)