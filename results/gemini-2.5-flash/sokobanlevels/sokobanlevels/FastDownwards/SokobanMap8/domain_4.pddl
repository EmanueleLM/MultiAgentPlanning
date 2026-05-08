(define (domain sokobanmap8)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        player
        box
        location
        direction
    )
    (:constants
        up down - direction
    )
    (:predicates
        (at_player ?p - player ?l - location)
        (at_box ?b - box ?l - location)
        (is_goal ?l - location)
        (adjacent ?l1 ?l2 - location ?d - direction)
        (clear ?l - location)
    )

    (:action move_up
        :parameters (?p - player ?l_from ?l_to - location)
        :precondition (and
            (at_player ?p ?l_from)
            (adjacent ?l_from ?l_to up)
            (clear ?l_to)
        )
        :effect (and
            (not (at_player ?p ?l_from))
            (at_player ?p ?l_to)
        )
    )

    (:action move_down
        :parameters (?p - player ?l_from ?l_to - location)
        :precondition (and
            (at_player ?p ?l_from)
            (adjacent ?l_from ?l_to down)
            (clear ?l_to)
        )
        :effect (and
            (not (at_player ?p ?l_from))
            (at_player ?p ?l_to)
        )
    )

    (:action push_up
        :parameters (?p - player ?b - box ?l_player ?l_box ?l_target - location)
        :precondition (and
            (at_player ?p ?l_player)
            (at_box ?b ?l_box)
            (adjacent ?l_player ?l_box up)
            (adjacent ?l_box ?l_target up)
            (clear ?l_target)
        )
        :effect (and
            (not (at_player ?p ?l_player))
            (at_player ?p ?l_box)
            (not (at_box ?b ?l_box))
            (at_box ?b ?l_target)
            (not (clear ?l_target))
            (clear ?l_box)
        )
    )

    (:action push_down
        :parameters (?p - player ?b - box ?l_player ?l_box ?l_target - location)
        :precondition (and
            (at_player ?p ?l_player)
            (at_box ?b ?l_box)
            (adjacent ?l_player ?l_box down)
            (adjacent ?l_box ?l_target down)
            (clear ?l_target)
        )
        :effect (and
            (not (at_player ?p ?l_player))
            (at_player ?p ?l_box)
            (not (at_box ?b ?l_box))
            (at_box ?b ?l_target)
            (not (clear ?l_target))
            (clear ?l_box)
        )
    )
)