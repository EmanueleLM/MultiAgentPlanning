(define (domain hanoi-6-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)         ; d1 is directly on d2 (disk stack)
        (on-peg ?d - disk ?p - peg)        ; d is the base disk on peg p
        (clear ?d - disk)                  ; d has nothing on top of it
        (peg-clear ?p - peg)               ; p is empty
        (smaller ?d1 - disk ?d2 - disk)    ; d1 < d2 (static size constraint)
    )
    (:functions
        (total-cost)
    )

    ;; 1. Move disk D from D_source to D_target (D/D -> D)
    ;; Moving a top disk from one stack onto another existing stack.
    (:action move-d-to-d
        :parameters (?d - disk ?s_d - disk ?t_d - disk)
        :precondition (and
            (on ?d ?s_d)
            (clear ?d)
            (clear ?t_d)
            (smaller ?d ?t_d) ; Must place smaller disk on larger disk
        )
        :effect (and
            (not (on ?d ?s_d))
            (not (clear ?t_d))
            (on ?d ?t_d)
            (clear ?s_d)
            (increase (total-cost) 1)
        )
    )

    ;; 2. Move disk D from D_source to empty peg P_target (D/D -> P)
    ;; Moving a top disk from a stack onto an empty peg.
    (:action move-d-to-p-empty
        :parameters (?d - disk ?s_d - disk ?p_t - peg)
        :precondition (and
            (on ?d ?s_d)
            (clear ?d)
            (peg-clear ?p_t)
        )
        :effect (and
            (not (on ?d ?s_d))
            (not (peg-clear ?p_t))
            (on-peg ?d ?p_t)
            (clear ?s_d)
            (increase (total-cost) 1)
        )
    )

    ;; 3. Move disk D from peg P_source to disk D_target (P/D -> D)
    ;; Moving the base disk of a previously empty peg onto an existing stack.
    (:action move-p-to-d
        :parameters (?d - disk ?p_s - peg ?t_d - disk)
        :precondition (and
            (on-peg ?d ?p_s)
            (clear ?d)
            (clear ?t_d)
            (smaller ?d ?t_d) ; Must place smaller disk on larger disk
        )
        :effect (and
            (not (on-peg ?d ?p_s))
            (not (clear ?t_d))
            (on ?d ?t_d)
            (peg-clear ?p_s)
            (increase (total-cost) 1)
        )
    )

    ;; 4. Move disk D from peg P_source to empty peg P_target (P/D -> P)
    ;; Moving the base disk of a previously empty peg onto a new empty peg.
    (:action move-p-to-p-empty
        :parameters (?d - disk ?p_s - peg ?p_t - peg)
        :precondition (and
            (on-peg ?d ?p_s)
            (clear ?d)
            (peg-clear ?p_t)
            (not (= ?p_s ?p_t))
        )
        :effect (and
            (not (on-peg ?d ?p_s))
            (not (peg-clear ?p_t))
            (on-peg ?d ?p_t)
            (peg-clear ?p_s)
            (increase (total-cost) 1)
        )
    )
)