(define (domain hanoi-5-disks)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        disk peg - base
    )
    (:predicates
        (on ?d - disk ?b - base) 
        (clear ?b - base) 
        (smaller ?d1 - disk ?d2 - disk)
    )
    (:functions
        (total-cost)
    )
    
    (:action move-d-to-d
        :parameters (?d - disk ?b_from - base ?d_to - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?b_from)
            (clear ?d_to)
            (smaller ?d ?d_to) 
        )
        :effect (and
            (not (on ?d ?b_from))
            (clear ?b_from)
            (not (clear ?d_to))
            (on ?d ?d_to)
            (increase (total-cost) 1)
        )
    )
    
    (:action move-d-to-peg
        :parameters (?d - disk ?b_from - base ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?b_from)
            (clear ?p_to)
        )
        :effect (and
            (not (on ?d ?b_from))
            (clear ?b_from)
            (not (clear ?p_to))
            (on ?d ?p_to)
            (increase (total-cost) 1)
        )
    )
)