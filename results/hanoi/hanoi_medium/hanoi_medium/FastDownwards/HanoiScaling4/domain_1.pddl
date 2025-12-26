(define (domain hanoi)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)     ; d1 is immediately on d2
        (top ?d - disk)                ; d is the top disk (clear)
        (base ?d - disk ?p - peg)      ; d is the bottom disk resting on peg p
        (empty ?p - peg)               ; peg p is empty
        (smaller ?d1 - disk ?d2 - disk) ; d1 < d2
    )

    ;; 1. Move D, which is the base disk on F, onto an Empty Peg T.
    (:action move-base-to-empty
        :parameters (?d - disk ?f - peg ?t - peg)
        :precondition (and
            (top ?d)
            (base ?d ?f)
            (empty ?t)
            (not (= ?f ?t))
        )
        :effect (and
            (not (base ?d ?f))
            (base ?d ?t)
            (empty ?f)
            (not (empty ?t))
        )
    )

    ;; 2. Move D, which is the base disk on F, onto Disk D_target on Peg T.
    (:action move-base-to-disk
        :parameters (?d - disk ?d_target - disk ?f - peg ?t - peg)
        :precondition (and
            (top ?d)
            (base ?d ?f)
            (top ?d_target)
            (smaller ?d ?d_target) ; Enforcement: cannot place larger disk on smaller disk
            (not (= ?f ?t))
        )
        :effect (and
            (not (base ?d ?f))
            (not (top ?d_target))
            (on ?d ?d_target)
            (empty ?f) ; F becomes empty
        )
    )

    ;; 3. Move D, which is on D_under on F, onto an Empty Peg T.
    (:action move-stack-to-empty
        :parameters (?d - disk ?d_under - disk ?f - peg ?t - peg)
        :precondition (and
            (top ?d)
            (on ?d ?d_under)
            (empty ?t)
            (not (= ?f ?t))
        )
        :effect (and
            (not (on ?d ?d_under))
            (top ?d_under) ; D_under is now clear
            (base ?d ?t)
            (not (empty ?t))
        )
    )

    ;; 4. Move D, which is on D_under on F, onto Disk D_target on Peg T.
    (:action move-stack-to-disk
        :parameters (?d - disk ?d_under - disk ?d_target - disk ?f - peg ?t - peg)
        :precondition (and
            (top ?d)
            (on ?d ?d_under)
            (top ?d_target)
            (smaller ?d ?d_target) ; Enforcement: cannot place larger disk on smaller disk
            (not (= ?f ?t))
        )
        :effect (and
            (not (on ?d ?d_under))
            (top ?d_under)
            (not (top ?d_target))
            (on ?d ?d_target)
        )
    )
)