(define (domain hanoi-7-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk
        peg
    )
    (:predicates
        (on-disk ?d1 - disk ?d2 - disk) ; d1 is immediately on d2
        (on-peg ?d - disk ?p - peg)     ; d is the base disk on peg p
        (clear ?d - disk)               ; d has nothing on top
        (available ?p - peg)            ; p has no disk on it
        (smaller ?d1 - disk ?d2 - disk) ; d1 size < d2 size (static)
    )

    (:functions
        (total-cost) - number
    )

    ;; 1. Move disk D from D_under to an empty peg DST
    (:action move-from-disk-to-peg
        :parameters (?d ?d_under - disk ?src ?dst - peg)
        :precondition (and
            (not (= ?src ?dst))
            (clear ?d)
            (on-disk ?d ?d_under)
            (available ?dst)
        )
        :effect (and
            (not (on-disk ?d ?d_under))
            (clear ?d_under)
            (not (available ?dst))
            (on-peg ?d ?dst)
            (increase (total-cost) 1)
        )
    )

    ;; 2. Move disk D from SRC base to an empty peg DST
    (:action move-from-peg-to-peg
        :parameters (?d - disk ?src ?dst - peg)
        :precondition (and
            (not (= ?src ?dst))
            (clear ?d)
            (on-peg ?d ?src)
            (available ?dst)
        )
        :effect (and
            (not (on-peg ?d ?src))
            (available ?src)
            (not (available ?dst))
            (on-peg ?d ?dst)
            (increase (total-cost) 1)
        )
    )

    ;; 3. Move disk D from D_under to disk D_new 
    (:action move-from-disk-to-disk
        :parameters (?d ?d_under ?d_new - disk ?src ?dst - peg)
        :precondition (and
            (clear ?d)
            (on-disk ?d ?d_under)
            (clear ?d_new)
            (smaller ?d ?d_new) 
        )
        :effect (and
            (not (on-disk ?d ?d_under))
            (clear ?d_under)
            (not (clear ?d_new))
            (on-disk ?d ?d_new)
            (increase (total-cost) 1)
        )
    )

    ;; 4. Move disk D from SRC base to disk D_new 
    (:action move-from-peg-to-disk
        :parameters (?d ?d_new - disk ?src ?dst - peg)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?src)
            (clear ?d_new)
            (smaller ?d ?d_new)
        )
        :effect (and
            (not (on-peg ?d ?src))
            (available ?src)
            (not (clear ?d_new))
            (on-disk ?d ?d_new)
            (increase (total-cost) 1)
        )
    )
)