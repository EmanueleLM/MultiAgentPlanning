(define (domain hanoi-5disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg
    )
    
    (:predicates
        (on ?d1 - disk ?d2 - disk)
        (on-peg ?d - disk ?p - peg)
        
        (clear-disk ?d - disk)
        (clear-peg ?p - peg)
        
        (smaller ?d1 - disk ?d2 - disk)
    )
    
    (:functions
        (total-cost) - number
    )

    (:action move_d_d_to_d
        :parameters (?d - disk ?d_from - disk ?d_to - disk)
        :precondition (and
            (on ?d ?d_from)
            (clear-disk ?d)
            (clear-disk ?d_to)
            (smaller ?d ?d_to)
        )
        :effect (and
            (not (on ?d ?d_from))
            (clear-disk ?d_from)
            (on ?d ?d_to)
            (not (clear-disk ?d_to))
            (increase (total-cost) 1)
        )
    )

    (:action move_d_d_to_p
        :parameters (?d - disk ?d_from - disk ?p_to - peg)
        :precondition (and
            (on ?d ?d_from)
            (clear-disk ?d)
            (clear-peg ?p_to)
        )
        :effect (and
            (not (on ?d ?d_from))
            (clear-disk ?d_from)
            (on-peg ?d ?p_to)
            (not (clear-peg ?p_to))
            (increase (total-cost) 1)
        )
    )

    (:action move_d_p_to_d
        :parameters (?d - disk ?p_from - peg ?d_to - disk)
        :precondition (and
            (on-peg ?d ?p_from)
            (clear-disk ?d)
            (clear-disk ?d_to)
            (smaller ?d ?d_to)
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (clear-peg ?p_from)
            (on ?d ?d_to)
            (not (clear-disk ?d_to))
            (increase (total-cost) 1)
        )
    )
    
    (:action move_d_p_to_p
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (on-peg ?d ?p_from)
            (clear-disk ?d)
            (clear-peg ?p_to)
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (clear-peg ?p_from)
            (on-peg ?d ?p_to)
            (not (clear-peg ?p_to))
            (increase (total-cost) 1)
        )
    )
)