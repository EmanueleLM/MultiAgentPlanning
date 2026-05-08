(define (domain sokobanmap2)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location
        agent
        sokobox
    )
    (:predicates
        (at_player ?p - agent ?l - location)
        (at_box ?b - sokobox ?l - location)
        (is_goal ?l - location)
        (is_wall ?l - location)
        (north ?l1 - location ?l2 - location)
        (south ?l1 - location ?l2 - location)
        (east ?l1 - location ?l2 - location)
        (west ?l1 - location ?l2 - location)
    )

    ;; Player movement actions
    (:action move_player_up
        :parameters (?p - agent ?from - location ?to - location)
        :precondition (and
            (at_player ?p ?from)
            (north ?from ?to)
            (not (is_wall ?to))
            (not (at_box box1 ?to))
        )
        :effect (and
            (not (at_player ?p ?from))
            (at_player ?p ?to)
        )
    )

    (:action move_player_down
        :parameters (?p - agent ?from - location ?to - location)
        :precondition (and
            (at_player ?p ?from)
            (south ?from ?to)
            (not (is_wall ?to))
            (not (at_box box1 ?to))
        )
        :effect (and
            (not (at_player ?p ?from))
            (at_player ?p ?to)
        )
    )

    (:action move_player_left
        :parameters (?p - agent ?from - location ?to - location)
        :precondition (and
            (at_player ?p ?from)
            (west ?from ?to)
            (not (is_wall ?to))
            (not (at_box box1 ?to))
        )
        :effect (and
            (not (at_player ?p ?from))
            (at_player ?p ?to)
        )
    )

    (:action move_player_right
        :parameters (?p - agent ?from - location ?to - location)
        :precondition (and
            (at_player ?p ?from)
            (east ?from ?to)
            (not (is_wall ?to))
            (not (at_box box1 ?to))
        )
        :effect (and
            (not (at_player ?p ?from))
            (at_player ?p ?to)
        )
    )

    ;; Box pushing actions
    (:action push_box_up
        :parameters (?p - agent ?b - sokobox ?p_from - location ?box_from - location ?box_to - location)
        :precondition (and
            (at_player ?p ?p_from)
            (at_box ?b ?box_from)
            (north ?p_from ?box_from) ; Player is south of the box
            (north ?box_from ?box_to) ; Box moves north
            (not (is_wall ?box_to))
            (not (at_box ?b ?box_to)) ; Ensure destination is not occupied by this box (or another)
        )
        :effect (and
            (not (at_player ?p ?p_from))
            (at_player ?p ?box_from)
            (not (at_box ?b ?box_from))
            (at_box ?b ?box_to)
        )
    )

    (:action push_box_down
        :parameters (?p - agent ?b - sokobox ?p_from - location ?box_from - location ?box_to - location)
        :precondition (and
            (at_player ?p ?p_from)
            (at_box ?b ?box_from)
            (south ?p_from ?box_from) ; Player is north of the box
            (south ?box_from ?box_to) ; Box moves south
            (not (is_wall ?box_to))
            (not (at_box ?b ?box_to))
        )
        :effect (and
            (not (at_player ?p ?p_from))
            (at_player ?p ?box_from)
            (not (at_box ?b ?box_from))
            (at_box ?b ?box_to)
        )
    )

    (:action push_box_left
        :parameters (?p - agent ?b - sokobox ?p_from - location ?box_from - location ?box_to - location)
        :precondition (and
            (at_player ?p ?p_from)
            (at_box ?b ?box_from)
            (west ?p_from ?box_from) ; Player is east of the box
            (west ?box_from ?box_to) ; Box moves west
            (not (is_wall ?box_to))
            (not (at_box ?b ?box_to))
        )
        :effect (and
            (not (at_player ?p ?p_from))
            (at_player ?p ?box_from)
            (not (at_box ?b ?box_from))
            (at_box ?b ?box_to)
        )
    )

    (:action push_box_right
        :parameters (?p - agent ?b - sokobox ?p_from - location ?box_from - location ?box_to - location)
        :precondition (and
            (at_player ?p ?p_from)
            (at_box ?b ?box_from)
            (east ?p_from ?box_from) ; Player is west of the box
            (east ?box_from ?box_to) ; Box moves east
            (not (is_wall ?box_to))
            (not (at_box ?b ?box_to))
        )
        :effect (and
            (not (at_player ?p ?p_from))
            (at_player ?p ?box_from)
            (not (at_box ?b ?box_from))
            (at_box ?b ?box_to)
        )
    )
)