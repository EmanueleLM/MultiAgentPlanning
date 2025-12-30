(define (domain hanoi-4-disk)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    
    (:types
        disk peg - object
    )
    
    (:predicates
        (on ?d - disk ?x - object) ; ?x can be a disk or a peg
        (clear ?x - object)      ; ?x can be a disk or a peg
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
    )
    
    (:functions
        (total-cost) - number
    )
    
    ; Move disk ?d from location ?x (disk or peg) to empty peg ?p_to
    (:action move-d-to-peg
        :parameters (?d - disk ?x - object ?p_to - peg)
        :precondition (and
            (on ?d ?x)
            (clear ?d)
            (clear ?p_to)
        )
        :effect (and
            (not (on ?d ?x))
            (not (clear ?p_to))
            (clear ?x) 
            (on ?d ?p_to)
            (increase (total-cost) 1)
        )
    )
    
    ; Move disk ?d from location ?x (disk or peg) onto disk ?t 
    (:action move-d-to-disk
        :parameters (?d - disk ?x - object ?t - disk)
        :precondition (and
            (on ?d ?x)
            (clear ?d)
            (clear ?t)
            (smaller ?d ?t) ; Rule: Disk d must be smaller than disk t
        )
        :effect (and
            (not (on ?d ?x))
            (not (clear ?t))
            (clear ?x) 
            (on ?d ?t)
            (increase (total-cost) 1)
        )
    )
)