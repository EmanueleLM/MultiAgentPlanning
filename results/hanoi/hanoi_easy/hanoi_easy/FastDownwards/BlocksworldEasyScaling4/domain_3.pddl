(define (domain hanoi-4-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk - object
        peg - object
    )

    (:predicates
        (on ?d - disk ?loc - object) 
        (clear ?loc - object) 
        (smaller ?d1 - disk ?d2 - disk)
    )
    
    (:functions
        (total-cost) - number
    )

    (:action move-disk-from-disk-to-peg
        :parameters (?d - disk ?ds - disk ?pt - peg)
        :precondition (and
            (on ?d ?ds)
            (clear ?d)
            (clear ?pt)
        )
        :effect (and
            (not (on ?d ?ds))
            (on ?d ?pt)
            (clear ?ds)
            (not (clear ?pt))
            (increase (total-cost) 1)
        )
    )

    (:action move-disk-from-peg-to-peg
        :parameters (?d - disk ?ps - peg ?pt - peg)
        :precondition (and
            (on ?d ?ps) 
            (clear ?d)
            (clear ?pt) 
        )
        :effect (and
            (not (on ?d ?ps))
            (on ?d ?pt)
            (clear ?ps)
            (not (clear ?pt)) 
            (increase (total-cost) 1)
        )
    )

    (:action move-disk-from-disk-to-disk
        :parameters (?d ?dt ?ds - disk)
        :precondition (and
            (on ?d ?ds)
            (clear ?d)
            (clear ?dt)
            (smaller ?d ?dt)
        )
        :effect (and
            (not (on ?d ?ds))
            (on ?d ?dt)
            (clear ?ds) 
            (not (clear ?dt))
            (increase (total-cost) 1)
        )
    )

    (:action move-disk-from-peg-to-disk
        :parameters (?d ?dt - disk ?ps - peg)
        :precondition (and
            (on ?d ?ps) 
            (clear ?d)
            (clear ?dt) 
            (smaller ?d ?dt)
        )
        :effect (and
            (not (on ?d ?ps))
            (on ?d ?dt)
            (clear ?ps)
            (not (clear ?dt)) 
            (increase (total-cost) 1)
        )
    )
)