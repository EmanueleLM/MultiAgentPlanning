(define (domain tower-of-hanoi)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk
        peg
    )
    (:predicates
        ; Location predicates
        (on ?d1 - disk ?d2 - disk) ; d1 is immediately on d2
        (on-peg ?d - disk ?p - peg) ; d is the base disk on peg p
        (clear ?d - disk) ; d has nothing on top of it
        (peg-clear ?p - peg) ; peg p has no disks on it

        ; Size predicates
        (smaller ?d1 - disk ?d2 - disk)
    )

    ;; 1. Move D from Disk D1 onto Disk D2
    (:action move_d_d
        :parameters (?d - disk ?d1 - disk ?d2 - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?d1)
            (clear ?d2)
            (smaller ?d ?d2)
            (not (= ?d1 ?d2))
        )
        :effect (and
            (not (on ?d ?d1))
            (not (clear ?d2))
            (on ?d ?d2)
            (clear ?d1)
        )
    )

    ;; 2. Move D from Disk D1 onto Peg P2
    (:action move_d_p
        :parameters (?d - disk ?d1 - disk ?p2 - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?d1)
            (peg-clear ?p2)
        )
        :effect (and
            (not (on ?d ?d1))
            (not (peg-clear ?p2))
            (on-peg ?d ?p2)
            (clear ?d1)
        )
    )

    ;; 3. Move D from Peg P1 onto Disk D2
    (:action move_p_d
        :parameters (?d - disk ?p1 - peg ?d2 - disk)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?p1)
            (clear ?d2)
            (smaller ?d ?d2)
        )
        :effect (and
            (not (on-peg ?d ?p1))
            (not (clear ?d2))
            (on ?d ?d2)
            (peg-clear ?p1)
        )
    )

    ;; 4. Move D from Peg P1 onto Peg P2
    (:action move_p_p
        :parameters (?d - disk ?p1 - peg ?p2 - peg)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?p1)
            (peg-clear ?p2)
            (not (= ?p1 ?p2))
        )
        :effect (and
            (not (on-peg ?d ?p1))
            (not (peg-clear ?p2))
            (on-peg ?d ?p2)
            (peg-clear ?p1)
        )
    )
)