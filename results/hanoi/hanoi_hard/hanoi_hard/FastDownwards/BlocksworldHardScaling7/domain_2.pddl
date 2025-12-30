(define (domain hanoi-6-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)   ; d1 is immediately above d2
        (on-peg ?d - disk ?p - peg)  ; d is the disk immediately above peg p (the base disk)
        (clear ?d - disk)            ; d has nothing on it
        (is-empty ?p - peg)          ; p has no disks
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
    )
    (:functions
        (total-cost)
    )

    ;; 1. Move D from Disk D_S onto Disk D_D
    (:action move-d-d
        :parameters (?d - disk ?d_s - disk ?d_d - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?d_s)
            (clear ?d_d)
            (smaller ?d ?d_d) ; D must be smaller than D_D
        )
        :effect (and
            (not (on ?d ?d_s))
            (on ?d ?d_d)
            (not (clear ?d_d))
            (clear ?d_s)
            (increase (total-cost) 1)
        )
    )

    ;; 2. Move D from Disk D_S onto Empty Peg P_D
    (:action move-d-p-empty
        :parameters (?d - disk ?d_s - disk ?p_d - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?d_s)
            (is-empty ?p_d)
        )
        :effect (and
            (not (on ?d ?d_s))
            (on-peg ?d ?p_d)
            (clear ?d_s)
            (not (is-empty ?p_d))
            (increase (total-cost) 1)
        )
    )

    ;; 3. Move D from Peg P_S (D is the base) onto Disk D_D
    (:action move-p-d
        :parameters (?d - disk ?p_s - peg ?d_d - disk)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?p_s)
            (clear ?d_d)
            (smaller ?d ?d_d) ; D must be smaller than D_D
        )
        :effect (and
            (not (on-peg ?d ?p_s))
            (on ?d ?d_d)
            (not (clear ?d_d))
            (is-empty ?p_s)
            (increase (total-cost) 1)
        )
    )

    ;; 4. Move D from Peg P_S (D is the base) onto Empty Peg P_D
    (:action move-p-p-empty
        :parameters (?d - disk ?p_s - peg ?p_d - peg)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?p_s)
            (is-empty ?p_d)
            (not (= ?p_s ?p_d))
        )
        :effect (and
            (not (on-peg ?d ?p_s))
            (on-peg ?d ?p_d)
            (is-empty ?p_s)
            (not (is-empty ?p_d))
            (increase (total-cost) 1)
        )
    )
)