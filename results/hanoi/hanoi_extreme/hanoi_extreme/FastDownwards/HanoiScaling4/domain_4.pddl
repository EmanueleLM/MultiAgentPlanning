(define (domain hanoi)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk object
        peg object
    )
    (:predicates
        (on ?d - disk ?b - object)
        (clear ?b - object)
        (smaller ?d1 - disk ?d2 - disk)
    )
    (:functions
        (total-cost)
    )

    (:action move-disk-to-peg
        :parameters (?d - disk ?b1 - object ?p_to - peg)
        :precondition (and
            (on ?d ?b1)
            (clear ?d)
            (clear ?p_to)
        )
        :effect (and
            (not (on ?d ?b1))
            (on ?d ?p_to)
            (not (clear ?p_to))
            (clear ?b1)
            (increase (total-cost) 1)
        )
    )

    (:action move-disk-to-disk
        :parameters (?d - disk ?b1 - object ?d_to - disk)
        :precondition (and
            (on ?d ?b1)
            (clear ?d)
            (clear ?d_to)
            (smaller ?d ?d_to)
        )
        :effect (and
            (not (on ?d ?b1))
            (on ?d ?d_to)
            (not (clear ?d_to))
            (clear ?b1)
            (increase (total-cost) 1)
        )
    )
)