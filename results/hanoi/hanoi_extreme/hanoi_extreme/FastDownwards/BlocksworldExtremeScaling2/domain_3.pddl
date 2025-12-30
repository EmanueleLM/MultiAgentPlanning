(define (domain hanoi_7disk)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        disk peg - object
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk) ; d1 is immediately above d2
        (clear ?d - disk) ; d is the top disk of its stack
        (located ?d - disk ?p - peg) ; d is anywhere on peg p
        (smallest-than ?d1 - disk ?d2 - disk) ; Size hierarchy: d1 < d2
        (available ?p - peg) ; Peg p is empty
        (on-base ?d - disk ?p - peg) ; d is the disk resting directly on peg P's base.
    )
    (:functions
        (total-cost) - number
    )

    ; Case 1: Move D from D_U_FROM onto D_U_TO (Disk to Disk)
    (:action move_d_d
        :parameters (?d - disk ?u_from - disk ?u_to - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (located ?d ?p_from)
            (located ?u_to ?p_to)
            (clear ?d)
            (clear ?u_to)
            (on ?d ?u_from)
            (smallest-than ?d ?u_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on ?d ?u_from))
            (on ?d ?u_to)
            (clear ?u_from)
            (not (clear ?u_to))
            (not (located ?d ?p_from))
            (located ?d ?p_to)
            (increase (total-cost) 1)
        )
    )

    ; Case 2: Move D from D_U_FROM onto Empty Peg P_TO (Disk to Peg)
    (:action move_d_p
        :parameters (?d - disk ?u_from - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (located ?d ?p_from)
            (available ?p_to)
            (clear ?d)
            (on ?d ?u_from)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on ?d ?u_from))
            (clear ?u_from)
            (not (available ?p_to))
            (not (located ?d ?p_from))
            (located ?d ?p_to)
            (increase (total-cost) 1)
        )
    )

    ; Case 3: Move Base Disk D onto D_U_TO (Base to Disk)
    (:action move_base_d
        :parameters (?d - disk ?u_to - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (located ?d ?p_from)
            (located ?u_to ?p_to)
            (clear ?d)
            (clear ?u_to)
            (on-base ?d ?p_from)
            (smallest-than ?d ?u_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on-base ?d ?p_from))
            (on ?d ?u_to)
            (not (clear ?u_to))
            (available ?p_from) 
            (not (located ?d ?p_from))
            (located ?d ?p_to)
            (increase (total-cost) 1)
        )
    )

    ; Case 4: Move Base Disk D onto Empty Peg P_TO (Base to Peg)
    (:action move_base_p
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (located ?d ?p_from)
            (available ?p_to)
            (clear ?d)
            (on-base ?d ?p_from)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on-base ?d ?p_from))
            (on-base ?d ?p_to)
            (available ?p_from)
            (not (available ?p_to))
            (not (located ?d ?p_from))
            (located ?d ?p_to)
            (increase (total-cost) 1)
        )
    )
)