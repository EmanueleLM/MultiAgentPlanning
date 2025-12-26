(define (domain hanoi-6-disks)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        disk
        peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - (either disk peg)) ; d1 is on d2 (d2 is a disk or peg)
        (clear ?x - (either disk peg)) ; x has nothing on it
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (static)
    )

    (:functions
        (total-cost) - number
    )

    (:action move
        :parameters (?d - disk ?p_from - peg ?p_to - peg ?b_from - (either disk peg) ?b_to - (either disk peg))
        :precondition (and
            (on ?d ?b_from)    
            (clear ?d)         
            (clear ?b_to)      
            (not (= ?p_from ?p_to)) 
            
            ; Size constraint: D must be smaller than B_TO (if B_TO is a disk).
            (not (smaller ?b_to ?d)) 
        )
        :effect (and
            (not (on ?d ?b_from))
            (on ?d ?b_to)

            (clear ?b_from)     
            (not (clear ?b_to)) 
            
            (increase (total-cost) 1)
        )
    )
)