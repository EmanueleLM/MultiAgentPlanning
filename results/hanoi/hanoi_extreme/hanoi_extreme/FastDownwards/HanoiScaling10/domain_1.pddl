(define (domain hanoi-6disks)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        disk peg - object
        place - (either disk peg)
    )
    (:predicates
        (on ?d - disk ?p - place)
        (clear ?p - place)
        (smaller ?d1 - disk ?d2 - disk) ; Static predicate defining size hierarchy
        (total-cost ?n - number)
    )

    (:action move
        :parameters (?d - disk ?from - place ?to - place)
        :precondition (and
            ; Rule 2: Move only the top disk (D must be clear)
            (clear ?d)
            
            ; Rule 1: D must be sitting on ?from
            (on ?d ?from)
            
            ; Target location ?to must be clear.
            (clear ?to)
            
            ; Rule 3: A larger disk may never be placed on top of a smaller disk.
            (or
                (peg ?to) ; If stacking on a peg, OK
                (smaller ?d ?to) ; If stacking on a disk, D must be smaller than T.
            )
        )
        :effect (and
            ; Update location
            (not (on ?d ?from))
            (on ?d ?to)
            
            ; Update clear status of locations
            (clear ?from)
            (not (clear ?to))
            
            (increase (total-cost) 1)
        )
    )
)