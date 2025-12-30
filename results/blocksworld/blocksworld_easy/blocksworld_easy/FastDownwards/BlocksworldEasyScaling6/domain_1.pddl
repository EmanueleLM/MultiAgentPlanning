(define (domain hanoi-4-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg - object
    )
    (:predicates
        (on ?d - disk ?l - (either disk peg))
        (clear ?x - (either disk peg))
        (smaller ?d1 - disk ?d2 - disk)
    )
    (:functions 
        (total-cost) - number
    )

    (:action move_d_to_d
        :parameters (?d - disk ?l_from - (either disk peg) ?d_dest - disk)
        :precondition (and
            (on ?d ?l_from)
            (clear ?d)
            (clear ?d_dest)
            (smaller ?d ?d_dest)
        )
        :effect (and
            (not (on ?d ?l_from))
            (on ?d ?d_dest)
            (clear ?l_from)
            (not (clear ?d_dest))
            (increase (total-cost) 1)
        )
    )

    (:action move_d_to_p
        :parameters (?d - disk ?l_from - (either disk peg) ?p_dest - peg)
        :precondition (and
            (on ?d ?l_from)
            (clear ?d)
            (clear ?p_dest)
        )
        :effect (and
            (not (on ?d ?l_from))
            (on ?d ?p_dest)
            (clear ?l_from)
            (not (clear ?p_dest))
            (increase (total-cost) 1)
        )
    )
)