(define (domain tower-of-hanoi)
    (:requirements :strips :typing :negative-preconditions)
    (:types 
        disk 
        peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk) ; d1 is immediately on d2
        (on-peg ?d - disk ?p - peg) ; d is the base disk resting on peg p
        (clear ?d - disk) ; d has nothing on it (is movable)
        (empty ?p - peg) ; p has no disks (is usable as base)
        (smaller ?d1 - disk ?d2 - disk) ; static: d1 is smaller than d2 (A < B < C < D < E < F)
    )

    ;; 1. Move disk D from stack (on D_F) to stack (on D_T)
    (:action move-disk-to-disk
        :parameters (?d ?d_f ?d_t - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?d_f)
            (clear ?d_t)
            (smaller ?d ?d_t) ; Must place smaller on larger
        )
        :effect (and
            (on ?d ?d_t)
            (clear ?d_f)
            (not (on ?d ?d_f))
            (not (clear ?d_t))
        )
    )

    ;; 2. Move disk D from stack (on D_F) to land on empty peg P_T
    (:action move-disk-to-empty-peg
        :parameters (?d - disk ?d_f - disk ?p_t - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?d_f)
            (empty ?p_t)
        )
        :effect (and
            (on-peg ?d ?p_t)
            (clear ?d_f)
            (not (on ?d ?d_f))
            (not (empty ?p_t))
        )
    )

    ;; 3. Move disk D from peg base P_F to land on D_T
    (:action move-base-disk-to-disk
        :parameters (?d - disk ?p_f - peg ?d_t - disk)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?p_f)
            (clear ?d_t)
            (smaller ?d ?d_t) ; Must place smaller on larger
        )
        :effect (and
            (on ?d ?d_t)
            (empty ?p_f)
            (not (on-peg ?d ?p_f))
            (not (clear ?d_t))
        )
    )

    ;; 4. Move disk D from peg base P_F to land on empty peg P_T
    (:action move-base-disk-to-empty-peg
        :parameters (?d - disk ?p_f ?p_t - peg)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?p_f)
            (empty ?p_t)
        )
        :effect (and
            (on-peg ?d ?p_t)
            (empty ?p_f)
            (not (on-peg ?d ?p_f))
            (not (empty ?p_t))
        )
    )
)