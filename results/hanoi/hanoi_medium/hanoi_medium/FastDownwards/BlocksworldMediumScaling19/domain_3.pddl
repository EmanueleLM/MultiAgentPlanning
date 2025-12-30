(define (domain hanoi-5disk)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types 
        loc
        disk peg - loc
    )

    (:predicates
        (on ?d - disk ?l - loc) ; d is directly on l (l can be a disk or a peg)
        (clear ?l - loc)      ; l has nothing on it
        (smaller ?d1 - disk ?d2 - disk) ; d1 < d2 (Static)
    )

    (:functions
        (total-cost) - number
    )

    ; Action 1: Move disk D to an empty Peg P
    (:action move-to-peg
        :parameters (?d - disk ?from - loc ?p - peg)
        :precondition (and
            ; 1. D must be on 'from' location (disk or peg)
            (on ?d ?from)
            ; 2. D must be the top disk
            (clear ?d)
            ; 3. Target peg P must be clear (empty)
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

    ; Action 2: Move disk D onto another disk TO_D
    (:action move-to-disk
        :parameters (?d - disk ?from - loc ?to_d - disk)
        :precondition (and
            ; 1. D must be on 'from' location (disk or peg)
            (on ?d ?from)
            ; 2. D must be the top disk
            (clear ?d)
            ; 3. Target disk TO_D must be clear
            (clear ?to_d)
            ; 4. Hanoi Rule 3: D must be smaller than TO_D
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