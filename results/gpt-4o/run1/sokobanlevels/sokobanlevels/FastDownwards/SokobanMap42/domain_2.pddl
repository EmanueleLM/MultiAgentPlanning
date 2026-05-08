(define (domain sokoban)
    (:requirements :strips :typing :negative-preconditions)
    (:types entity position)
    (:predicates
        (at ?e - entity ?p - position)
        (goal ?p - position)
        (is_space ?p - position)
        (adjacent ?p1 ?p2 - position)
        (clear ?p - position)
        (box ?e - entity)
        (player ?e - entity)
    )
    
    (:action move
        :parameters (?from ?to - position)
        :precondition (and
            (at ?player - entity ?from)
            (adjacent ?from ?to)
            (clear ?to)
            (player ?player)
        )
        :effect (and
            (not (at ?player ?from))
            (at ?player ?to)
        )
    )
    
    (:action push-box
        :parameters (?player - entity ?from ?to ?box-pos - position)
        :precondition (and
            (at ?player ?from)
            (at box ?box-pos)
            (adjacent ?from ?box-pos)
            (adjacent ?box-pos ?to)
            (clear ?to)
        )
        :effect (and
            (not (at ?player ?from))
            (at ?player ?box-pos)
            (not (at box ?box-pos))
            (at box ?to)
            (not (clear ?to))
            (clear ?box-pos)
        )
    )
)