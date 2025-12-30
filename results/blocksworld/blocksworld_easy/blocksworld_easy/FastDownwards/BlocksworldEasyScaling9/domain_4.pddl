(define (domain hanoi-4-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)

    (:types
        support
        disk - support
        peg - support
    )

    (:predicates
        ; d1 is immediately on support s2 (disk or peg)
        (on ?d1 - disk ?s2 - support) 
        
        ; d1 is smaller than d2 (static constraint)
        (smaller ?d1 - disk ?d2 - disk)        
        
        ; s has nothing on it (top disk or empty peg)
        (clear ?s - support)         
    )
    
    (:functions
        (total-cost) - number
    )

    (:action move-to-peg
        :parameters (?d - disk ?s_from - support ?p_to - peg)
        :precondition (and
            (on ?d ?s_from)
            (clear ?d)
            (clear ?p_to)
            (not (= ?s_from ?p_to))
        )
        :effect (and
            (not (on ?d ?s_from))
            (on ?d ?p_to)
            (not (clear ?p_to))
            (clear ?s_from)
            (increase (total-cost) 1)
        )
    )

    (:action move-to-disk
        :parameters (?d - disk ?s_from - support ?d_to - disk)
        :precondition (and
            (on ?d ?s_from)
            (clear ?d)
            (clear ?d_to)
            (smaller ?d ?d_to)
            (not (= ?d ?d_to))
        )
        :effect (and
            (not (on ?d ?s_from))
            (on ?d ?d_to)
            (not (clear ?d_to))
            (clear ?s_from)
            (increase (total-cost) 1)
        )
    )
)