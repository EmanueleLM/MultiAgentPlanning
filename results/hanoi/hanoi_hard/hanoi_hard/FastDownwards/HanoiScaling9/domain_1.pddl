```pddl
(define (domain hanoi-6-disks)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)         ; d1 is immediately on d2
        (on-peg ?d - disk ?p - peg)        ; d is the bottom disk on p
        (smaller ?d1 - disk ?d2 - disk)    ; d1 is smaller than d2 (static)
        (clear ?d - disk)                  ; d has no disk on it (is movable)
        (empty ?p - peg)                   ; p has no disks on it
    )

    ;; 1. Move D from a disk (D_src_below) to an empty peg (P_tgt)
    (:action move-disk-to-peg-empty
        :parameters (?d - disk ?p_src - peg ?p_tgt - peg ?d_src_below - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?d_src_below)
            (empty ?p_tgt)
            (not (= ?p_src ?p_tgt))
        )
        :effect (and
            (not (on ?d ?d_src_below))
            (clear ?d_src_below)
            (on-peg ?d ?p_tgt)
            (not (empty ?p_tgt))
        )
    )

    ;; 2. Move D from a disk (D_src_below) onto a disk (D_tgt_below)
    (:action move-disk-to-disk-below
        :parameters (?d - disk ?p_src - peg ?p_tgt - peg ?d_src_below - disk ?d_tgt_below - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?d_src_below)
            (clear ?d_tgt_below)
            (smaller ?d ?d_tgt_below) ; Hanoi Rule: Smaller on Larger
            (not (= ?p_src ?p_tgt))
        )
        :effect (and
            (not (on ?d ?d_src_below))
            (clear ?d_src_below)
            (on ?d ?d_tgt_below)
            (not (clear ?d_tgt_below))
        )
    )

    ;; 3. Move D (base disk) from peg P_src to empty peg P_tgt
    (:action move-base-disk-to-peg-empty
        :parameters (?d - disk ?p_src - peg ?p_tgt - peg)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?p_src)
            (empty ?p_tgt)
            (not (= ?p_src ?p_tgt))
        )
        :effect (and
            (not (on-peg ?d ?p_src))
            (empty ?p_src)
            (on-peg ?d ?p_tgt)
            (not (empty ?p_tgt))
        )
    )

    ;; 4. Move D (base disk) from peg P_src onto a disk (D_tgt_below)
    (:action move-base-disk-to-disk-below
        :parameters (?d - disk ?p_src - peg ?p_tgt - peg ?d_tgt_below - disk)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?p_src)
            (clear ?d_tgt_below)
            (smaller ?d ?d_tgt_below) ; Hanoi Rule: Smaller on Larger
            (not (= ?p_src ?p_tgt))
        )
        :effect (and
            (not (on-peg ?d ?p_src))
            (empty ?p_src)
            (on ?d ?d_tgt_below)
            (not (clear ?d_tgt_below))
        )
    )
)
```