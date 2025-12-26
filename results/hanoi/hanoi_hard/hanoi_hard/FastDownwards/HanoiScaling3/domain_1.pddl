(define (domain hanoi-5disk)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        disk peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)
        (on-peg ?d - disk ?p - peg)
        (clear ?x - (either disk peg))
        (smaller ?d1 - disk ?d2 - disk)
        (total-cost ?c)
    )

    (:action move_d_to_d
        :parameters (?d ?s_b ?t_b - disk)
        :precondition (and
            (on ?d ?s_b)
            (clear ?d)
            (clear ?t_b)
            (smaller ?d ?t_b)
        )
        :effect (and
            (not (on ?d ?s_b))
            (on ?d ?t_b)
            (clear ?s_b)
            (not (clear ?t_b))
            (increase (total-cost) 1)
        )
    )

    (:action move_d_to_peg
        :parameters (?d ?s_b - disk 
                     ?target - peg
        )
        :precondition (and
            (on ?d ?s_b)
            (clear ?d)
            (clear ?target)
        )
        :effect (and
            (not (on ?d ?s_b))
            (on-peg ?d ?target)
            (clear ?s_b)
            (not (clear ?target))
            (increase (total-cost) 1)
        )
    )

    (:action move_peg_to_d
        :parameters (?d ?t_b - disk 
                     ?source - peg
        )
        :precondition (and
            (on-peg ?d ?source)
            (clear ?d)
            (clear ?t_b)
            (smaller ?d ?t_b)
        )
        :effect (and
            (not (on-peg ?d ?source))
            (on ?d ?t_b)
            (clear ?source)
            (not (clear ?t_b))
            (increase (total-cost) 1)
        )
    )

    (:action move_peg_to_peg
        :parameters (?d - disk 
                     ?source ?target - peg
        )
        :precondition (and
            (on-peg ?d ?source)
            (clear ?d)
            (clear ?target)
        )
        :effect (and
            (not (on-peg ?d ?source))
            (on-peg ?d ?target)
            (clear ?source)
            (not (clear ?target))
            (increase (total-cost) 1)
        )
    )
)