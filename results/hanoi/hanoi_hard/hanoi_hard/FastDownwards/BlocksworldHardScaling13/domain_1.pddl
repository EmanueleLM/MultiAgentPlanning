(define (domain hanoi-6-disks)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        disk peg
    )
    
    (:predicates
        (on ?d - disk ?base - (either disk peg))
        (clear ?base - (either disk peg))
        (smaller ?d1 - disk ?d2 - disk)
    )
    
    (:functions
        (total-cost)
    )
    
    (:action move
        :parameters (?d - disk ?f - (either disk peg) ?t - (either disk peg))
        :precondition (and
            (on ?d ?f)
            (clear ?d)
            (clear ?t)
            
            ; Size constraint: D must be smaller than T if T is a disk
            ; (NOT (T is a disk AND D is NOT smaller than T))
            (not (and (disk ?t) (not (smaller ?d ?t))))
        )
        :effect (and
            (not (on ?d ?f))
            (on ?d ?t)
            
            ; F becomes clear (its top element moved away)
            (clear ?f) 
            
            ; T becomes covered
            (not (clear ?t))
            
            (increase (total-cost) 1)
        )
    )
)