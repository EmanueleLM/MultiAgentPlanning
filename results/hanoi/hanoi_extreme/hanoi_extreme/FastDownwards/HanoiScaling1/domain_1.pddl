(define (domain hanoi-4-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    
    (:types
        location
        peg disk - location
    )
    
    (:predicates
        (on ?d - disk ?l - location)
        (clear ?l - location)
        (smaller ?d1 - disk ?d2 - disk)
    )

    (:functions
        (total-cost)
    )

    (:action move-to-peg
        :parameters (?d - disk ?from - location ?p - peg)
        :precondition (and
            (on ?d ?from)
            (clear ?d)
            (clear ?p)
            (not (= ?from ?p))
        )
        :effect (and
            (not (on ?d ?from))
            (on ?d ?p)
            (clear ?from)
            (not (clear ?p))
            (increase (total-cost) 1)
        )
    )

    (:action move-to-disk
        :parameters (?d_top - disk ?from - location ?d_base - disk)
        :precondition (and
            (on ?d_top ?from)
            (clear ?d_top)
            (clear ?d_base)
            (smaller ?d_top ?d_base)
        )
        :effect (and
            (not (on ?d_top ?from))
            (on ?d_top ?d_base)
            (clear ?from)
            (not (clear ?d_base))
            (increase (total-cost) 1)
        )
    )
)