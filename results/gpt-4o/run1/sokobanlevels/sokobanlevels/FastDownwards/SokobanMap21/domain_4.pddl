(define (domain sokoban)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        player box location
    )
    (:predicates
        (at ?p - player ?l - location)
        (box_at ?b - box ?l - location)
        (goal ?l - location)
        (adjacent ?l1 ?l2 - location)
        (clear ?l - location)
    )
    (:action move
        :parameters (?p - player ?from ?to - location)
        :precondition (and
            (at ?p ?from)
            (adjacent ?from ?to)
            (clear ?to)
        )
        :effect (and
            (not (at ?p ?from))
            (at ?p ?to)
            (clear ?from)
            (not (clear ?to))
        )
    )
    (:action push
        :parameters (?p - player ?b - box ?from ?box_to ?to - location)
        :precondition (and
            (at ?p ?from)
            (box_at ?b ?box_to)
            (adjacent ?from ?box_to)
            (adjacent ?box_to ?to)
            (clear ?to)
        )
        :effect (and
            (not (at ?p ?from))
            (not (box_at ?b ?box_to))
            (at ?p ?box_to)
            (box_at ?b ?to)
            (clear ?from)
            (not (clear ?to))
        )
    )
)