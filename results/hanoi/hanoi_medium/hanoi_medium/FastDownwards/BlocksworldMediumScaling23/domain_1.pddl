(define (domain hanoi-5)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)
        (on-peg ?d - disk ?p - peg)
        (clear ?d - disk)
        (peg-clear ?p - peg)
        (smaller ?d1 - disk ?d2 - disk)
    )

    ;; 1. Move disk D from D_src to D_trg (Disk to Disk)
    (:action move-d-to-d
        :parameters (?d ?d_src ?d_trg - disk)
        :precondition (and 
            (clear ?d)
            (on ?d ?d_src)
            (clear ?d_trg)
            (smaller ?d ?d_trg)
        )
        :effect (and
            (not (on ?d ?d_src))
            (on ?d ?d_trg)
            (not (clear ?d_trg))
            (clear ?d_src)
        )
    )

    ;; 2. Move disk D from D_src to Empty Peg P_trg (Disk to Peg Base)
    (:action move-d-to-p-empty
        :parameters (?d ?d_src - disk ?p_trg - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?d_src)
            (peg-clear ?p_trg)
        )
        :effect (and
            (not (on ?d ?d_src))
            (on-peg ?d ?p_trg)
            (not (peg-clear ?p_trg))
            (clear ?d_src)
        )
    )

    ;; 3. Move Base Disk D from Peg P_src to Disk D_trg (Base Disk to Disk)
    (:action move-d-base-to-d
        :parameters (?d ?d_trg - disk ?p_src - peg)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?p_src)
            (clear ?d_trg)
            (smaller ?d ?d_trg)
        )
        :effect (and
            (not (on-peg ?d ?p_src))
            (peg-clear ?p_src)
            (on ?d ?d_trg)
            (not (clear ?d_trg))
        )
    )

    ;; 4. Move Base Disk D from Peg P_src to Empty Peg P_trg (Base Disk to Peg Base)
    (:action move-d-base-to-p-empty
        :parameters (?d - disk ?p_src ?p_trg - peg)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?p_src)
            (peg-clear ?p_trg)
        )
        :effect (and
            (not (on-peg ?d ?p_src))
            (peg-clear ?p_src)
            (on-peg ?d ?p_trg)
            (not (peg-clear ?p_trg))
        )
    )
)