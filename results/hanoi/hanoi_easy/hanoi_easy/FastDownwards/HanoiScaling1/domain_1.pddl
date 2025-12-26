(define (domain hanoi-4disk)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg - object
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)
        (on-peg ?d - disk ?p - peg)
        (clear-d ?d - disk)
        (clear-p ?p - peg)
        (smaller ?d1 - disk ?d2 - disk)
        (location ?d - disk ?p - peg)
    )

    (:functions
        (total-cost) - number
    )

    (:action move-d-d--d-d
        :parameters (?d - disk ?d_from - disk ?d_to - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear-d ?d)
            (on ?d ?d_from)
            (location ?d ?p_from)
            
            (clear-d ?d_to)
            (location ?d_to ?p_to)
            
            (smaller ?d ?d_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on ?d ?d_from))
            (not (clear-d ?d_to))
            
            (clear-d ?d_from)
            (on ?d ?d_to)
            
            (not (location ?d ?p_from))
            (location ?d ?p_to)
            
            (increase (total-cost) 1)
        )
    )

    (:action move-d-d--d-p
        :parameters (?d - disk ?d_from - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear-d ?d)
            (on ?d ?d_from)
            (location ?d ?p_from)
            
            (clear-p ?p_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on ?d ?d_from))
            (clear-d ?d_from)
            
            (not (clear-p ?p_to))
            (on-peg ?d ?p_to)
            
            (not (location ?d ?p_from))
            (location ?d ?p_to)
            
            (increase (total-cost) 1)
        )
    )

    (:action move-d-p--d-d
        :parameters (?d - disk ?d_to - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear-d ?d)
            (on-peg ?d ?p_from)
            (location ?d ?p_from)
            
            (clear-d ?d_to)
            (location ?d_to ?p_to)
            
            (smaller ?d ?d_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (clear-p ?p_from)
            
            (not (clear-d ?d_to))
            (on ?d ?d_to)
            
            (not (location ?d ?p_from))
            (location ?d ?p_to)
            
            (increase (total-cost) 1)
        )
    )

    (:action move-d-p--d-p
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear-d ?d)
            (on-peg ?d ?p_from)
            (location ?d ?p_from)
            
            (clear-p ?p_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (clear-p ?p_from)
            
            (not (clear-p ?p_to))
            (on-peg ?d ?p_to)
            
            (not (location ?d ?p_from))
            (location ?d ?p_to)
            
            (increase (total-cost) 1)
        )
    )
)