(define (domain hanoi-4disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk
        peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk) ; d1 is directly on d2
        (on-peg ?d - disk ?p - peg) ; d is the base disk on peg p
        (clear ?x - disk) ; Disk x has nothing on it
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (static)
        (empty ?p - peg) ; Peg p has no disks
    )
    (:functions
        (total-cost) - number
    )

    ;; Action 1: Move disk D (from disk D_from) onto disk D_to
    ;; Requires D < D_to. D_from becomes clear. D_to becomes blocked.
    (:action move_d_d
        :parameters (?d - disk ?d_from - disk ?d_to - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?d_from)
            (clear ?d_to)
            (smaller ?d ?d_to)
        )
        :effect (and
            (not (on ?d ?d_from))
            (on ?d ?d_to)
            (clear ?d_from)
            (not (clear ?d_to))
            (increase (total-cost) 1)
        )
    )

    ;; Action 2: Move disk D (from disk D_from) onto empty peg P_to
    ;; D_from becomes clear. P_to becomes blocked (not empty).
    (:action move_d_p_new
        :parameters (?d - disk ?d_from - disk ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?d_from)
            (empty ?p_to)
        )
        :effect (and
            (not (on ?d ?d_from))
            (on-peg ?d ?p_to)
            (clear ?d_from)
            (not (empty ?p_to))
            (increase (total-cost) 1)
        )
    )

    ;; Action 3: Move disk D (from peg P_from, only disk) onto disk D_to
    ;; Requires D < D_to. P_from becomes empty. D_to becomes blocked.
    (:action move_p_d
        :parameters (?d - disk ?d_to - disk ?p_from - peg)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?p_from)
            (clear ?d_to)
            (smaller ?d ?d_to)
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (on ?d ?d_to)
            (empty ?p_from)
            (not (clear ?d_to))
            (increase (total-cost) 1)
        )
    )

    ;; Action 4: Move disk D (from peg P_from, only disk) onto empty peg P_to
    ;; P_from becomes empty. P_to becomes blocked (not empty).
    (:action move_p_p_new
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?p_from)
            (empty ?p_to)
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (on-peg ?d ?p_to)
            (empty ?p_from)
            (not (empty ?p_to))
            (increase (total-cost) 1)
        )
    )
)