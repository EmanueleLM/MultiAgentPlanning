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