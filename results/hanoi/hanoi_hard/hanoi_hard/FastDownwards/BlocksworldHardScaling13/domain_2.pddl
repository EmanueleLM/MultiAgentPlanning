(define (domain hanoi-6-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        location 
        disk - location
        peg - location
    )
    
    (:predicates
        (on ?d - disk ?base - location)
        (clear ?base - location)
        (smaller ?d1 - disk ?d2 - disk)
    )
    
    (:functions
        (total-cost)
    )
    
    ; Action 1: Move D from F to Peg P
    ; P is a peg, size constraint is always met.
    (:action move-disk-to-peg
        :parameters (?d - disk ?f - location ?p - peg)
        :precondition (and
            (on ?d ?f)
            (clear ?d)
            (clear ?p)
        )
        :effect (and
            (not (on ?d ?f))
            (on ?d ?p)
            
            (clear ?f) 
            (not (clear ?p))
            
            (increase (total-cost) 1)
        )
    )

    ; Action 2: Move D from F onto Disk T
    ; T is a disk, D must be smaller than T.
    (:action move-disk-to-disk
        :parameters (?d - disk ?f - location ?t - disk)
        :precondition (and
            (on ?d ?f)
            (clear ?d)
            (clear ?t)
            (smaller ?d ?t)
        )
        :effect (and
            (not (on ?d ?f))
            (on ?d ?t)
            
            (clear ?f) 
            (not (clear ?t))
            
            (increase (total-cost) 1)
        )
    )
)