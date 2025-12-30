(define (domain hanoi-5disk)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk
        peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk) ; d1 is immediately on top of d2
        (on-peg ?d - disk ?p - peg) ; d is immediately on top of peg p
        (clear ?x) ; x is a disk or peg, with nothing on top
        (smaller ?d1 - disk ?d2 - disk) ; d1 size < d2 size
    )
    (:functions
        (total-cost) - number
    )

    ; 1. Move disk D from disk D1 to disk D2
    (:action move-dd
        :parameters (?d - disk ?d1 - disk ?d2 - disk)
        :precondition (and
            (on ?d ?d1)
            (clear ?d)
            (clear ?d2)
            (smaller ?d ?d2) ; Constraint: D must be smaller than D2
        )
        :effect (and
            (not (on ?d ?d1))
            (on ?d ?d2)
            (clear ?d1)
            (not (clear ?d2))
            (increase (total-cost) 1)
        )
    )

    ; 2. Move disk D from disk D1 to peg P2
    (:action move-dp
        :parameters (?d - disk ?d1 - disk ?p2 - peg)
        :precondition (and
            (on ?d ?d1)
            (clear ?d)
            (clear ?p2) 
        )
        :effect (and
            (not (on ?d ?d1))
            (on-peg ?d ?p2)
            (clear ?d1)
            (not (clear ?p2))
            (increase (total-cost) 1)
        )
    )

    ; 3. Move disk D from peg P1 to disk D2
    (:action move-pd
        :parameters (?d - disk ?p1 - peg ?d2 - disk)
        :precondition (and
            (on-peg ?d ?p1)
            (clear ?d)
            (clear ?d2)
            (smaller ?d ?d2) ; Constraint: D must be smaller than D2
        )
        :effect (and
            (not (on-peg ?d ?p1))
            (on ?d ?d2)
            (clear ?p1)
            (not (clear ?d2))
            (increase (total-cost) 1)
        )
    )

    ; 4. Move disk D from peg P1 to peg P2
    (:action move-pp
        :parameters (?d - disk ?p1 - peg ?p2 - peg)
        :precondition (and
            (on-peg ?d ?p1)
            (clear ?d)
            (clear ?p2)
        )
        :effect (and
            (not (on-peg ?d ?p1))
            (on-peg ?d ?p2)
            (clear ?p1)
            (not (clear ?p2))
            (increase (total-cost) 1)
        )
    )
)