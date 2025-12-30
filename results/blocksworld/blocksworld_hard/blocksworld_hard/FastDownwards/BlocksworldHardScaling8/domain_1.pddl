(define (domain hanoi6)
    (:requirements :typing :negative-preconditions :action-costs :equality)
    (:types
        disk peg - object
        loc - (either disk peg)
    )
    (:predicates
        (on ?d - disk ?l - loc)
        (clear ?l - loc)
        (smaller ?d1 - disk ?d2 - disk) 
    )
    (:functions
        (total-cost) - number
    )
    
    (:action move
        :parameters (?d - disk ?source - loc ?target - loc)
        :precondition (and
            (on ?d ?source)
            (clear ?d) ; Must be the top disk
            (clear ?target) ; Destination must be clear
            (not (= ?source ?target)) 
            
            ; Constraint Check: A larger disk cannot be placed on a smaller disk.
            ; If ?target is a disk ?dt, ?d must be smaller than ?dt.
            ; This is enforced by ensuring NO forbidden placement exists:
            (not 
                (exists (?dt - disk)
                    (and
                        (= ?target ?dt)
                        (not (smaller ?d ?dt)) ; ?d is larger or equal to ?dt
                    )
                )
            )
        )
        :effect (and
            (not (on ?d ?source))
            (on ?d ?target)
            (clear ?source) 
            (not (clear ?target))
            (increase (total-cost) 1)
        )
    )
)