(define (domain tower-of-hanoi-6disk)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk peg
    )
    (:predicates
        ;; Location predicates
        (on ?d1 - disk ?d2 - disk)         ; d1 is on d2
        (bottom-on-peg ?d - disk ?p - peg) ; d is the bottom disk resting on p
        (clear ?d - disk)                  ; d is the topmost disk
        (peg-clear ?p - peg)               ; p is empty

        ;; Size constraints: d1 is smaller than d2
        (smaller ?d1 - disk ?d2 - disk)
    )

    ;; 1. Move D from D_from to D_to (Disk support to Disk support)
    (:action move-disk-d-to-d
        :parameters (?d - disk ?d_from - disk ?d_to - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?d_from)
            (clear ?d_to)
            (smaller ?d ?d_to) ; Constraint check: D must be smaller than D_to
        )
        :effect (and
            (not (on ?d ?d_from))
            (not (clear ?d_to))
            (on ?d ?d_to)
            (clear ?d_from)
        )
    )

    ;; 2. Move D from D_from to P_to (Disk support to Peg)
    (:action move-disk-d-to-p
        :parameters (?d - disk ?d_from - disk ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?d_from)
            (peg-clear ?p_to) ; Destination peg must be empty
        )
        :effect (and
            (not (on ?d ?d_from))
            (bottom-on-peg ?d ?p_to)
            (clear ?d_from)
            (not (peg-clear ?p_to))
        )
    )

    ;; 3. Move D from P_from to D_to (Peg support to Disk support)
    (:action move-disk-p-to-d
        :parameters (?d - disk ?p_from - peg ?d_to - disk)
        :precondition (and
            (clear ?d)
            (bottom-on-peg ?d ?p_from)
            (clear ?d_to)
            (smaller ?d ?d_to) ; Constraint check: D must be smaller than D_to
        )
        :effect (and
            (not (bottom-on-peg ?d ?p_from))
            (not (clear ?d_to))
            (on ?d ?d_to)
            (peg-clear ?p_from)
        )
    )

    ;; 4. Move D from P_from to P_to (Peg support to Peg)
    (:action move-disk-p-to-p
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear ?d)
            (bottom-on-peg ?d ?p_from)
            (peg-clear ?p_to) ; Destination peg must be empty
        )
        :effect (and
            (not (bottom-on-peg ?d ?p_from))
            (bottom-on-peg ?d ?p_to)
            (peg-clear ?p_from)
            (not (peg-clear ?p_to))
        )
    )