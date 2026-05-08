(define (domain sokoban)
    (:requirements :strips :typing :negative-preconditions)
    (:types player box square)

    (:predicates
        (at ?p - player ?sq - square)
        (box_at ?b - box ?sq - square)
        (goal ?sq - square)
        (free ?sq - square)
        (adjacent ?sq1 - square ?sq2 - square)
        (wall ?sq - square)
    )

    (:action move
        :parameters (?p - player ?from - square ?to - square)
        :precondition (and (at ?p ?from) (free ?to) (adjacent ?from ?to))
        :effect (and (not (at ?p ?from)) (at ?p ?to))
    )

    (:action push
        :parameters (?p - player ?b - box ?from - square ?to - square ?to2 - square)
        :precondition 
        (and 
            (at ?p ?from) 
            (box_at ?b ?to) 
            (free ?to2) 
            (adjacent ?from ?to) 
            (adjacent ?to ?to2)
        )
        :effect 
        (and 
            (not (at ?p ?from)) 
            (not (box_at ?b ?to)) 
            (at ?p ?to) 
            (box_at ?b ?to2)
        )
    )
)