(define (domain hanoi6)
    (:requirements :typing :negative-preconditions :action-costs :equality)
    (:types
        location - object
        disk peg - location
    )
    (:predicates
        (on ?d - disk ?l - location)
        (clear ?l - location)
        (smaller ?d1 - disk ?d2 - disk) 
    )
    (:functions
        (total-cost) - number
    )
    
    (:action move
        :parameters (?d - disk ?source - location ?target - location)
        :precondition (and
            (on ?d ?source)
            (clear ?d) ; Must be the top disk
            (clear ?target) ; Destination must be clear
            (not (= ?source ?target)) 
            
            ; Constraint Check: A larger disk cannot be placed on a smaller disk.
            ; This relies on checking if ?target, which is a location, is a disk ?dt,
            ; and ensuring ?d is smaller than ?dt if ?target is a disk.
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