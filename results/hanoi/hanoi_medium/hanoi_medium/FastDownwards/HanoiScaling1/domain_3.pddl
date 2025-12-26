(define (domain hanoi-4-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)

    (:types
        disk peg - object
    )

    (:predicates
        (on ?d - disk ?l - object)
        (clear ?l - object)
        (smaller ?d1 - disk ?d2 - disk)
        (disk-on-peg ?d - disk ?p - peg)
    )

    (:functions
        (total-cost) - number
    )

    ; Action 1: Move disk D from a support L_from (peg or disk) to an empty peg P_to
    (:action move-to-empty-peg
        :parameters (?d - disk ?l_from - object ?p_from - peg ?p_to - peg)
        :precondition (and
            (on ?d ?l_from)
            (clear ?d)
            (clear ?p_to)
            (disk-on-peg ?d ?p_from)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on ?d ?l_from))
            (not (clear ?p_to))
            (on ?d ?p_to)

            (clear ?l_from)

            (not (disk-on-peg ?d ?p_from))
            (disk-on-peg ?d ?p_to)

            (increase (total-cost) 1)
        )
    )

    ; Action 2: Move disk D from a support L_from (peg or disk) onto a larger disk D_under
    (:action move-onto-disk
        :parameters (?d - disk ?l_from - object ?d_under - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (on ?d ?l_from)
            (clear ?d)

            (clear ?d_under)
            (smaller ?d ?d_under)

            (disk-on-peg ?d ?p_from)
            (disk-on-peg ?d_under ?p_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on ?d ?l_from))
            (not (clear ?d_under))
            (on ?d ?d_under)

            (clear ?l_from)

            (not (disk-on-peg ?d ?p_from))
            (disk-on-peg ?d ?p_to)

            (increase (total-cost) 1)
        )
    )
)