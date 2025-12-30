(define (domain hanoi-6disks)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk
        peg
    )
    
    (:predicates
        (on ?d1 - disk ?d2 - disk)         ; d1 is immediately on d2
        (on-peg ?d - disk ?p - peg)        ; d is the base disk resting on peg p
        (clear ?d - disk)                  ; Disk d has nothing on top
        (empty ?p - peg)                   ; Peg p has no disks
        (is-smaller ?d1 - disk ?d2 - disk) ; Static size constraint (d1 < d2)
    )

    ;; Action 1: Move D from Disk X to Disk Y (d/x -> d/y)
    (:action move_d_to_d
        :parameters (?d ?x ?y - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?x)
            (clear ?y)
            (is-smaller ?d ?y) ; Size constraint: D must be smaller than Y
        )
        :effect (and
            (not (on ?d ?x))
            (not (clear ?y))
            (on ?d ?y)
            (clear ?x)
        )
    )

    ;; Action 2: Move D from Disk X to Peg P2 (d/x -> p/p2)
    (:action move_d_to_p
        :parameters (?d ?x - disk ?p2 - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?x)
            (empty ?p2)
        )
        :effect (and
            (not (on ?d ?x))
            (not (empty ?p2))
            (on-peg ?d ?p2)
            (clear ?x)
        )
    )

    ;; Action 3: Move D from Peg P1 to Disk Y (p/p1 -> d/y)
    ;; Requires D to be the only disk on P1 (since D must be clear and on-peg P1)
    (:action move_p_to_d
        :parameters (?d ?y - disk ?p1 - peg)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?p1)
            (clear ?y)
            (is-smaller ?d ?y) ; Size constraint: D must be smaller than Y
        )
        :effect (and
            (not (on-peg ?d ?p1))
            (not (clear ?y))
            (on ?d ?y)
            (empty ?p1)
        )
    )

    ;; Action 4: Move D from Peg P1 to Peg P2 (p/p1 -> p/p2)
    ;; Requires D to be the only disk on P1
    (:action move_p_to_p
        :parameters (?d - disk ?p1 ?p2 - peg)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?p1)
            (empty ?p2)
        )
        :effect (and
            (not (on-peg ?d ?p1))
            (not (empty ?p2))
            (on-peg ?d ?p2)
            (empty ?p1)
        )
    )
)