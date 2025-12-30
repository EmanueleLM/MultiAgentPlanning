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
    
    ; Action for moving a disk onto an empty peg
    (:action move-disk-to-peg
        :parameters (?d - disk ?f - location ?p - peg)
        :precondition (and
            (on ?d ?f)     ; ?d is on location ?f (disk or peg)
            (clear ?d)     ; ?d is the top disk of its current stack
            (clear ?p)     ; Target peg ?p is empty
        )
        :effect (and
            (not (on ?d ?f))
            (on ?d ?p)
            
            (clear ?f)     ; Location ?f is now exposed
            (not (clear ?p)) ; Target peg ?p is no longer empty
            
            (increase (total-cost) 1)
        )
    )

    ; Action for moving a disk onto another disk
    (:action move-disk-to-disk
        :parameters (?d - disk ?f - location ?t - disk)
        :precondition (and
            (on ?d ?f)     ; ?d is on location ?f
            (clear ?d)     ; ?d is the top disk of its current stack
            (clear ?t)     ; Target disk ?t is exposed
            (smaller ?d ?t) ; HARD CONSTRAINT: ?d must be smaller than ?t
        )
        :effect (and
            (not (on ?d ?f))
            (on ?d ?t)
            
            (clear ?f)     ; Location ?f is now exposed
            (not (clear ?t)) ; Target disk ?t is no longer exposed
            
            (increase (total-cost) 1)
        )
    )
)