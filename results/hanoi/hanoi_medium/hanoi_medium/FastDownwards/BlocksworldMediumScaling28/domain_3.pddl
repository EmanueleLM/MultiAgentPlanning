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

    ;; Action 1: Move D from D_Under (stack) to empty peg P_to
    (:action move-disk-to-empty-peg-from-stack
        :parameters (?d - disk ?d_under - disk ?p_to - peg)
        :precondition (and
            (clear-disk ?d)
            (on ?d ?d_under)
            (clear-peg ?p_to)
        )
        :effect (and
            (not (on ?d ?d_under))
            (clear-disk ?d_under)
            (on-peg ?d ?p_to)
            (not (clear-peg ?p_to))
        )
    )

    ;; Action 2: Move D (base disk) from P_from to empty peg P_to
    (:action move-disk-to-empty-peg-from-base
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

    ;; Action 3: Move D from D_Under (stack) onto D_target
    (:action move-disk-to-disk-from-stack
        :parameters (?d - disk ?d_under - disk ?d_target - disk)
        :precondition (and
            (smaller ?d ?d_target) ; D must be smaller than the disk it is placed on
            (clear-disk ?d)
            (on ?d ?d_under)
            (clear-disk ?d_target)
        )
        :effect (and
            (not (on ?d ?d_under))
            (clear-disk ?d_under)
            (on ?d ?d_target)
            (not (clear-disk ?d_target))
        )
    )

    ;; Action 4: Move D (base disk) from P_from onto D_target
    (:action move-disk-to-disk-from-base
        :parameters (?d - disk ?d_target - disk ?p_from - peg)
        :precondition (and
            (smaller ?d ?d_target) ; D must be smaller than the disk it is placed on
            (clear-disk ?d)
            (on-peg ?d ?p_from)
            (clear-disk ?d_target)
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (on ?d ?d_target)
            (not (clear-disk ?d_target))
            (clear-peg ?p_from) ; P_from becomes empty
        )
    )
)