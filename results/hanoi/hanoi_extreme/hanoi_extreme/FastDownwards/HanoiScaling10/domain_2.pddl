(define (domain hanoi-6disks)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        place - object
        disk peg - place
    )
    (:predicates
        (on ?d - disk ?p - place)
        (clear ?p - place)
        (smaller ?d1 - disk ?d2 - disk) ; Static predicate defining size hierarchy
    )
    (:functions
        (total-cost) - number
    )

    (:action move-to-peg
        :parameters (?d - disk ?from - place ?p - peg)
        :precondition (and
            ; Rule 2: D must be the top disk
            (clear ?d)
            
            ; Rule 1: D must be sitting on ?from
            (on ?d ?from)
            
            ; Target peg ?p must be clear/empty
            (clear ?p)
            
            ; Rule 3 satisfied implicitly (always allowed to place on an empty peg)
        )
        :effect (and
            ; Update location
            (not (on ?d ?from))
            (on ?d ?p)
            
            ; Update clear status of locations
            (clear ?from)
            (not (clear ?p))
            
            (increase (total-cost) 1)
        )
    )

    (:action move-to-disk
        :parameters (?d - disk ?from - place ?t - disk)
        :precondition (and
            ; Rule 2: D must be the top disk
            (clear ?d)
            
            ; Rule 1: D must be sitting on ?from
            (on ?d ?from)
            
            ; Target disk ?t must be the top disk on its stack
            (clear ?t)
            
            ; Rule 3: D must be smaller than T
            (smaller ?d ?t)
        )
        :effect (and
            ; Update location
            (not (on ?d ?from))
            (on ?d ?t)
            
            ; Update clear status of locations
            (clear ?from)
            (not (clear ?t))
            
            (increase (total-cost) 1)
        )
    )
)