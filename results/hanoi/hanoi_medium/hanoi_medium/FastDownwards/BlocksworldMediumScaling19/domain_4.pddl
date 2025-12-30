(define (domain hanoi-5disk)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types 
        loc
        disk peg - loc
    )

    (:predicates
        (on ?d - disk ?l - loc)
        (clear ?l - loc)
        (smaller ?d1 - disk ?d2 - disk)
    )

    (:functions
        (total-cost) - number
    )

    (:action move-to-peg
        :parameters (?d - disk ?from - loc ?p - peg)
        :precondition (and
            (on ?d ?from)
            (clear ?d)
            (clear ?p)
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
        :parameters (?d - disk ?from - loc ?to_d - disk)
        :precondition (and
            (on ?d ?from)
            (clear ?d)
            (clear ?to_d)
            (smaller ?d ?to_d)
        )
        :effect (and
            (not (on ?d ?from))
            (on ?d ?to_d)
            (clear ?from)
            (not (clear ?to_d))
            (increase (total-cost) 1)
        )
    )
)