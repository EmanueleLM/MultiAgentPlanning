(define (domain hanoi-5-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg - object
    )
    (:predicates
        (on ?d1 - disk ?x2 - object)
        (clear ?x - object)
        (smaller ?d1 - disk ?d2 - disk)
    )
    (:functions
        (total-cost)
    )

    (:action move-onto-peg
        :parameters (?d - disk ?x - object ?p - peg)
        :precondition (and
            (on ?d ?x)
            (clear ?d)
            (clear ?p)
        )
        :effect (and
            (not (on ?d ?x))
            (on ?d ?p)
            (clear ?x)
            (not (clear ?p))
            (increase (total-cost) 1)
        )
    )
    
    (:action move-onto-disk
        :parameters (?d - disk ?x - object ?d_under - disk)
        :precondition (and
            (on ?d ?x)
            (clear ?d)
            (clear ?d_under)
            (smaller ?d ?d_under)
        )
        :effect (and
            (not (on ?d ?x))
            (on ?d ?d_under)
            (clear ?x)
            (not (clear ?d_under))
            (increase (total-cost) 1)
        )
    )
)