(define (domain hanoi-5disks)
    (:requirements :strips :typing :negative-preconditions)
    (:types 
        object
        disk - object
        peg - object
    )
    (:predicates
        (on ?d - disk ?x - object) ; d is immediately on x (x can be a disk or a peg)
        (is-clear ?x - object) ; x has nothing on it
        (smaller ?d1 - disk ?d2 - disk) ; Static size comparison (d1 < d2)
    )

    ; Action 1: Move disk D from Disk X to Disk Y
    (:action move-disk-to-disk
        :parameters (?d - disk ?x - disk ?y - disk)
        :precondition (and
            (is-clear ?d)
            (on ?d ?x)
            (is-clear ?y)
            (smaller ?d ?y) ; Constraint: Moving disk D must be smaller than target disk Y
        )
        :effect (and
            (not (on ?d ?x))
            (not (is-clear ?y))
            (on ?d ?y)
            (is-clear ?x)
        )
    )

    ; Action 2: Move disk D from Disk X to Peg P
    (:action move-disk-to-peg
        :parameters (?d - disk ?x - disk ?p - peg)
        :precondition (and
            (is-clear ?d)
            (on ?d ?x)
            (is-clear ?p) ; Peg P is empty
        )
        :effect (and
            (not (on ?d ?x))
            (not (is-clear ?p))
            (on ?d ?p)
            (is-clear ?x)
        )
    )
    
    ; Action 3: Move disk D from Peg P1 to Disk Y
    (:action move-peg-to-disk
        :parameters (?d - disk ?p1 - peg ?y - disk)
        :precondition (and
            (is-clear ?d)
            (on ?d ?p1) ; D is the base disk on P1
            (is-clear ?y)
            (smaller ?d ?y) ; Constraint: Moving disk D must be smaller than target disk Y
        )
        :effect (and
            (not (on ?d ?p1))
            (not (is-clear ?y))
            (on ?d ?y)
            (is-clear ?p1)
        )
    )

    ; Action 4: Move disk D from Peg P1 to Peg P2
    (:action move-peg-to-peg
        :parameters (?d - disk ?p1 - peg ?p2 - peg)
        :precondition (and
            (is-clear ?d)
            (on ?d ?p1) ; D is the base disk on P1
            (is-clear ?p2) ; Peg P2 is empty
        )
        :effect (and
            (not (on ?d ?p1))
            (not (is-clear ?p2))
            (on ?d ?p2)
            (is-clear ?p1)
        )
    )
)