(define (domain tower-of-hanoi-5disk)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk
        peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)          ; d1 is immediately on d2
        (on-peg ?d - disk ?p - peg)         ; d is the bottom disk on peg p
        (clear-disk ?d - disk)              ; d has nothing on it (is top, available to move)
        (clear-peg ?p - peg)                ; peg p has nothing on it (is empty)
        (smaller ?d1 - disk ?d2 - disk)     ; d1 < d2 (size constraint)
    )

    ;; Action 1: Move D from peg P_from (single disk stack) to empty peg P_to
    (:action move-d-peg-to-empty-peg
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear-disk ?d)
            (on-peg ?d ?p_from)
            (clear-peg ?p_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (on-peg ?d ?p_to)
            (clear-peg ?p_from)
            (not (clear-peg ?p_to))
        )
    )

    ;; Action 2: Move D from disk D_under (P_from stack) to empty peg P_to
    (:action move-d-disk-to-empty-peg
        :parameters (?d - disk ?d_under - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear-disk ?d)
            (on ?d ?d_under)
            (clear-peg ?p_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on ?d ?d_under))
            (clear-disk ?d_under)
            (on-peg ?d ?p_to)
            (not (clear-peg ?p_to))
        )
    )

    ;; Action 3: Move D from peg P_from (single disk stack) onto disk D_target (P_to stack)
    (:action move-d-peg-to-disk
        :parameters (?d - disk ?d_target - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (smaller ?d ?d_target) ; D must be smaller than the disk it is placed on
            (clear-disk ?d)
            (on-peg ?d ?p_from)
            (clear-disk ?d_target)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (on ?d ?d_target)
            (not (clear-disk ?d_target))
            (clear-peg ?p_from) ; P_from becomes empty
        )
    )

    ;; Action 4: Move D from disk D_under (P_from stack) onto disk D_target (P_to stack)
    (:action move-d-disk-to-disk
        :parameters (?d - disk ?d_under - disk ?d_target - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (smaller ?d ?d_target) ; D must be smaller than the disk it is placed on
            (clear-disk ?d)
            (on ?d ?d_under)
            (clear-disk ?d_target)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on ?d ?d_under))
            (clear-disk ?d_under)
            (on ?d ?d_target)
            (not (clear-disk ?d_target))
        )
    )
)