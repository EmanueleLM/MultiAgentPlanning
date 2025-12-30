(define (domain hanoi-6disk)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk peg
    )
    (:predicates
        ; Location predicates
        (on-d ?d1 - disk ?d2 - disk) ; d1 is immediately on d2
        (on-p ?d - disk ?p - peg)    ; d is immediately on peg p
        (clear-d ?d - disk)          ; d has nothing on top of it
        (clear-p ?p - peg)           ; p has no disks on it (empty)

        ; Size predicates
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
    )

    ;; 1. Move Disk D from Disk Z to Disk T
    (:action move-disk-to-disk
        :parameters (?d - disk ?z - disk ?t - disk)
        :precondition (and
            (on-d ?d ?z)
            (clear-d ?d)
            (clear-d ?t)
            (smaller ?d ?t) ; Constraint: D must be smaller than T
        )
        :effect (and
            (not (on-d ?d ?z))
            (on-d ?d ?t)
            (clear-d ?z)
            (not (clear-d ?t))
        )
    )

    ;; 2. Move Disk D from Disk Z to Peg P (Peg must be empty/clear)
    (:action move-disk-to-peg
        :parameters (?d - disk ?z - disk ?p - peg)
        :precondition (and
            (on-d ?d ?z)
            (clear-d ?d)
            (clear-p ?p) ; Constraint: Peg must be empty
        )
        :effect (and
            (not (on-d ?d ?z))
            (on-p ?d ?p)
            (clear-d ?z)
            (not (clear-p ?p))
        )
    )

    ;; 3. Move Disk D from Peg Z to Disk T (Z must become clear)
    (:action move-peg-to-disk
        :parameters (?d - disk ?z - peg ?t - disk)
        :precondition (and
            (on-p ?d ?z)
            (clear-d ?d)
            (clear-d ?t)
            (smaller ?d ?t) ; Constraint: D must be smaller than T
        )
        :effect (and
            (not (on-p ?d ?z))
            (on-d ?d ?t)
            (clear-p ?z)
            (not (clear-d ?t))
        )
    )

    ;; 4. Move Disk D from Peg Z to Peg P (P must be empty/clear)
    (:action move-peg-to-peg
        :parameters (?d - disk ?z - peg ?p - peg)
        :precondition (and
            (on-p ?d ?z)
            (clear-d ?d)
            (clear-p ?p) ; Constraint: Peg must be empty
        )
        :effect (and
            (not (on-p ?d ?z))
            (on-p ?d ?p)
            (clear-p ?z)
            (not (clear-p ?p))
        )
    )
)