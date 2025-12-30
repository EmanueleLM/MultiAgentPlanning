(define (domain hanoi-7-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)

    (:types
        disk peg - object
        support - (either disk peg)
    )

    (:predicates
        (on ?d - disk ?s - support)
        (clear ?d - disk)
        (smaller ?d1 - disk ?d2 - disk)
    )

    (:functions
        (total-cost) - number
    )

    (:action move
        :parameters (?d - disk ?f - support ?t - support)
        :precondition (and
            (on ?d ?f)
            (clear ?d)
            (not (= ?f ?t)) 

            (or
                (peg ?t)
                (and 
                    (disk ?t) 
                    (clear ?t) 
                    (smaller ?d ?t)
                )
            )
        )
        :effect (and
            (not (on ?d ?f))
            (on ?d ?t)
            
            (when (disk ?f) (clear ?f))
            
            (when (disk ?t) (not (clear ?t)))
            
            (increase (total-cost) 1)
        )
    )
)