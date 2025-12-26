(define (domain hanoi-5disk)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        disk peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)
        (on-peg ?d - disk ?p - peg)
        (disk-clear ?d - disk)
        (peg-clear ?p - peg)
        (smaller ?d1 - disk ?d2 - disk)
    )
    (:functions
        (total-cost) - number
    )

    (:action move_d_to_d
        :parameters (?d ?s_b ?t_b - disk)
        :precondition (and
            (on ?d ?s_b)
            (disk-clear ?d)
            (disk-clear ?t_b)
            (smaller ?d ?t_b)
        )
        :effect (and
            (not (on ?d ?s_b))
            (on ?d ?t_b)
            (disk-clear ?s_b)
            (not (disk-clear ?t_b))
            (increase (total-cost) 1)
        )
    )

    (:action move_d_to_peg
        :parameters (?d ?s_b - disk 
                     ?target - peg
        )
        :precondition (and
            (on ?d ?s_b)
            (disk-clear ?d)
            (peg-clear ?target)
        )
        :effect (and
            (not (on ?d ?s_b))
            (on-peg ?d ?target)
            (disk-clear ?s_b)
            (not (peg-clear ?target))
            (increase (total-cost) 1)
        )
    )

    (:action move_peg_to_d
        :parameters (?d ?t_b - disk 
                     ?source - peg
        )
        :precondition (and
            (on-peg ?d ?source)
            (disk-clear ?d)
            (disk-clear ?t_b)
            (smaller ?d ?t_b)
        )
        :effect (and
            (not (on-peg ?d ?source))
            (on ?d ?t_b)
            (peg-clear ?source)
            (not (disk-clear ?t_b))
            (increase (total-cost) 1)
        )
    )

    (:action move_peg_to_peg
        :parameters (?d - disk 
                     ?source ?target - peg
        )
        :precondition (and
            (on-peg ?d ?source)
            (disk-clear ?d)
            (peg-clear ?target)
        )
        :effect (and
            (not (on-peg ?d ?source))
            (on-peg ?d ?target)
            (peg-clear ?source)
            (not (peg-clear ?target))
            (increase (total-cost) 1)
        )
    )
)