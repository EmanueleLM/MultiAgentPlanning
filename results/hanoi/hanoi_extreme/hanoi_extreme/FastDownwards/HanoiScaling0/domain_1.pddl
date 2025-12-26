(define (domain hanoi-4-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg - object
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)
        (on-peg ?d - disk ?p - peg)
        (clear ?x)
        (smaller ?d1 - disk ?d2 - disk)
    )
    (:functions
        (total-cost)
    )

    (:action move)
        :parameters (?d - disk ?s_f - (either disk peg) ?s_t - (either disk peg))
        :precondition (and
            (clear ?d)
            (or 
                (and (disk ?s_f) (on ?d ?s_f))
                (and (peg ?s_f) (on-peg ?d ?s_f))
            )
            (clear ?s_t)
            (not (and (disk ?s_t) (smaller ?s_t ?d)))
        )
        :effect (and
            (increase (total-cost) 1)
            (clear ?s_f) 
            (when (disk ?s_f) (not (on ?d ?s_f)))
            (when (peg ?s_f) (not (on-peg ?d ?s_f)))
            (when (disk ?s_t) (on ?d ?s_t))
            (when (peg ?s_t) (on-peg ?d ?s_t))
            (not (clear ?s_t))
        )
)