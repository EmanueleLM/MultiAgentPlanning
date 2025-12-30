(define (domain BlocksworldHardScaling28)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)
        (on-peg ?d - disk ?p - peg)
        (clear ?d - disk)
        (empty ?p - peg)
        (larger ?d1 - disk ?d2 - disk)
    )

    ;; 1. Move D from Disk D_from to Disk D_to
    ;; D must be smaller than D_to
    (:action move-D-to-D
        :parameters (?d - disk ?d_from - disk ?d_to - disk)
        :precondition (and
            (on ?d ?d_from)
            (clear ?d)
            (clear ?d_to)
            (not (larger ?d ?d_to))
        )
        :effect (and
            (on ?d ?d_to)
            (clear ?d_from)
            (not (on ?d ?d_from))
            (not (clear ?d_to))
        )
    )

    ;; 2. Move D from Disk D_from to Peg P_to (P_to must be empty)
    (:action move-D-to-P-from-D
        :parameters (?d - disk ?d_from - disk ?p_to - peg)
        :precondition (and
            (on ?d ?d_from)
            (clear ?d)
            (empty ?p_to)
        )
        :effect (and
            (on-peg ?d ?p_to)
            (clear ?d_from)
            (not (on ?d ?d_from))
            (not (empty ?p_to))
        )
    )

    ;; 3. Move D from Peg P_from to Disk D_to
    ;; D must be smaller than D_to
    (:action move-D-to-D-from-P
        :parameters (?d - disk ?p_from - peg ?d_to - disk)
        :precondition (and
            (on-peg ?d ?p_from)
            (clear ?d)
            (clear ?d_to)
            (not (larger ?d ?d_to))
        )
        :effect (and
            (on ?d ?d_to)
            (empty ?p_from)
            (not (on-peg ?d ?p_from))
            (not (clear ?d_to))
        )
    )

    ;; 4. Move D from Peg P_from to Peg P_to (P_to must be empty)
    (:action move-D-to-P-from-P
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (on-peg ?d ?p_from)
            (clear ?d)
            (empty ?p_to)
        )
        :effect (and
            (on-peg ?d ?p_to)
            (empty ?p_from)
            (not (on-peg ?d ?p_from))
            (not (empty ?p_to))
        )
    )
)