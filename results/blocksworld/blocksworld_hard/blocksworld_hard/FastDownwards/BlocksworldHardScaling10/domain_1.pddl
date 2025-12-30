(define (domain hanoi-6-disks)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        disk peg - object
    )
    (:predicates
        (on ?d - disk ?o - (either disk peg))
        (clear ?o - (either disk peg))
        (smaller ?d1 - disk ?d2 - disk)
    )
    
    (:functions
        (total-cost) - number
    )

    (:action move
        :parameters (?d - disk ?src - (either disk peg) ?dest - (either disk peg))
        :precondition (and
            (on ?d ?src)
            (clear ?d)
            (clear ?dest)
            
            ;; Size constraint check: d must be smaller than dest, if dest is a disk.
            (or 
                (peg ?dest) ; Case 1: Destination is a peg (always allowed)
                (and (disk ?dest) (smaller ?d ?dest)) ; Case 2: Destination is a disk, and ?d is smaller
            )
        )
        :effect (and
            (not (on ?d ?src))
            (on ?d ?dest)
            (clear ?src)
            (not (clear ?dest))
            (increase (total-cost) 1)
        )
    )
)