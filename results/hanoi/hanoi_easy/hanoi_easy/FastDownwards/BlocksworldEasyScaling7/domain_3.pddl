(define (domain hanoi-4-disk)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    
    (:types
        base 
        disk - base
        peg - base
    )
    
    (:predicates
        (on ?d - disk ?x - base) 
        (clear ?x - base)      
        (smaller ?d1 - disk ?d2 - disk)
    )
    
    (:functions
        (total-cost) - number
    )
    
    (:action move-d-to-peg
        :parameters (?d - disk ?x - base ?p_to - peg)
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
    
    (:action move-d-to-disk
        :parameters (?d - disk ?x - base ?t - disk)
        :precondition (and
            (on ?d ?x)
            (clear ?d)
            (clear ?t)
            (smaller ?d ?t) 
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