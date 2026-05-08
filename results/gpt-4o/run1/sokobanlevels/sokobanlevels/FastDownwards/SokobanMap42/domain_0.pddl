(define (domain sokoban)
    (:requirements :strips :typing :negative-preconditions)
    (:types entity position)
    (:predicates
        (at ?e - entity ?p - position)
        (goal ?p - position)
        (is_space ?p - position)
        (adjacent ?p1 ?p2 - position)
        (clear ?p - position)
    )
    
    (:action move
        :parameters (?dir - direction ?from - position ?to - position)
        :precondition (and
            (at player ?from)
            (adjacent ?from ?to)
            (clear ?to)
        )
        :effect (and
            (not (at player ?from))
            (at player ?to)
        )
    )
    
    (:action push-box
        :parameters (?from - position ?to - position ?box-pos - position)
        :precondition (and
            (at player ?from)
            (at box ?box-pos)
            (adjacent ?from ?box-pos)
            (adjacent ?box-pos ?to)
            (clear ?to)
        )
        :effect (and
            (not (at player ?from))
            (at player ?box-pos)
            (not (at box ?box-pos))
            (at box ?to)
            (not (clear ?to))
            (clear ?box-pos)
        )
    )
)