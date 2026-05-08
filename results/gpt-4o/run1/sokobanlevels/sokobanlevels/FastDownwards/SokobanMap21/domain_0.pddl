(define (domain sokoban)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location player box goal
    )
    (:predicates
        (at_player ?p - player ?l - location)
        (at_box ?b - box ?l - location)
        (goal_location ?g - goal ?l - location)
        (adjacent ?l1 - location ?l2 - location)
        (clear ?l - location)
    )
    (:action move_player
        :parameters (?p - player ?from - location ?to - location)
        :precondition (and
            (at_player ?p ?from)
            (adjacent ?from ?to)
            (clear ?to)
        )
        :effect (and
            (not (at_player ?p ?from))
            (at_player ?p ?to)
        )
    )
    (:action push_box
        :parameters (?p - player ?b - box ?player_from - location ?box_from - location ?box_to - location)
        :precondition (and
            (at_player ?p ?player_from)
            (at_box ?b ?box_from)
            (adjacent ?player_from ?box_from)
            (adjacent ?box_from ?box_to)
            (clear ?box_to)
        )
        :effect (and
            (not (at_player ?p ?player_from))
            (not (at_box ?b ?box_from))
            (at_player ?p ?box_from)
            (at_box ?b ?box_to)
            (clear ?player_from)
            (not (clear ?box_to))
        )
    )
)