(define (domain hanoi-5disks)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)   ; d1 is immediately on d2
        (on-peg ?d - disk ?p - peg)  ; d is the base disk resting on peg p
        (clear ?d - disk)            ; d has nothing on it (is the top disk)
        (empty ?p - peg)             ; p has no disks on it
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (A < B < C < D < E)
    )

    ;; Action 1: Move disk D from D_from to D_to (Disk -> Disk)
    ;; Moves a non-base disk onto an existing stack head.
    (:action move-disk-on-disk-to-disk
        :parameters (?d - disk ?d_from - disk ?d_to - disk)
        :precondition (and
            (on ?d ?d_from)
            (clear ?d)
            (clear ?d_to)
            (smaller ?d ?d_to)
        )
        :effect (and
            (not (on ?d ?d_from))
            (on ?d ?d_to)
            (clear ?d_from)
            (not (clear ?d_to))
        )
    )

    ;; Action 2: Move disk D from D_from to Peg P_to (Disk -> Empty Peg)
    ;; Moves a non-base disk onto a newly empty peg.
    (:action move-disk-on-disk-to-empty-peg
        :parameters (?d - disk ?d_from - disk ?p_to - peg)
        :precondition (and
            (on ?d ?d_from)
            (clear ?d)
            (empty ?p_to)
        )
        :effect (and
            (not (on ?d ?d_from))
            (on-peg ?d ?p_to)
            (clear ?d_from)
            (not (empty ?p_to))
        )
    )

    ;; Action 3: Move disk D from Peg P_from to D_to (Base Disk -> Disk)
    ;; Moves the base disk of a stack onto an existing stack head.
    (:action move-base-disk-to-disk
        :parameters (?d - disk ?p_from - peg ?d_to - disk)
        :precondition (and
            (on-peg ?d ?p_from)
            (clear ?d)
            (clear ?d_to)
            (smaller ?d ?d_to)
            (not (empty ?p_from)) 
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (on ?d ?d_to)
            (empty ?p_from)
            (not (clear ?d_to))
        )
    )

    ;; Action 4: Move disk D from Peg P_from to Peg P_to (Base Disk -> Empty Peg)
    ;; Moves the base disk of a stack to an empty peg.
    (:action move-base-disk-to-empty-peg
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (on-peg ?d ?p_from)
            (clear ?d)
            (empty ?p_to)
            (not (= ?p_from ?p_to))
            (not (empty ?p_from))
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (on-peg ?d ?p_to)
            (empty ?p_from)
            (not (empty ?p_to))
        )
    )
)