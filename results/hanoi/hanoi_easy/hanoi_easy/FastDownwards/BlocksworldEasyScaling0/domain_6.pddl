(define (domain hanoi-4disk)
    (:requirements :strips :typing :action-costs)
    (:types
        location 
        peg disk - location
    )
    (:predicates
        (on ?d1 - disk ?x2 - location)
        (clear ?x - location)
        (smaller ?d1 - disk ?d2 - disk)
    )
    (:functions
        (total-cost)
    )

    (:action move-to-peg
        :parameters (?d - disk ?x_from - location ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?x_from)
            (clear ?p_to)
        )
        :effect (and
            (not (on ?d ?x_from))
            (not (clear ?p_to)) 
            (on ?d ?p_to)
            (clear ?x_from)
            (increase (total-cost) 1)
        )
    )

    (:action move-to-disk
        :parameters (?d - disk ?x_from - location ?d_to - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?x_from)
            (clear ?d_to)
            (smaller ?d ?d_to)
        )
        :effect (and
            (not (on ?d ?x_from))
            (not (clear ?d_to))
            (on ?d ?d_to)
            (clear ?x_from)
            (increase (total-cost) 1)
        )
    )
)