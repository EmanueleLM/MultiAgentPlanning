(define (domain hanoi-5disks)
    (:requirements :strips :typing :negative-preconditions)
    (:types 
        object
        disk - object
        peg - object
    )
    (:predicates
        (on ?d - disk ?x - object)
        (is-clear ?x - object)
        (smaller ?d1 - disk ?d2 - disk)
    )

    ; Action 1: Move disk D from Disk X to Disk Y
    (:action move-disk-to-disk
        :parameters (?d - disk ?x - disk ?y - disk)
        :precondition (and
            (is-clear ?d)
            (on ?d ?x)
            (is-clear ?y)
            (smaller ?d ?y) ; Cannot place larger disk on smaller disk
        )
        :effect (and
            (not (on ?d ?x))
            (not (is-clear ?y))
            (on ?d ?y)
            (is-clear ?x)
        )
    )

    ; Action 2: Move disk D from Disk X to Peg P (empty peg)
    (:action move-disk-to-peg
        :parameters (?d - disk ?x - disk ?p - peg)
        :precondition (and
            (is-clear ?d)
            (on ?d ?x)
            (is-clear ?p) ; Target peg must be empty
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
            (on ?d ?p1)
            (is-clear ?y)
            (smaller ?d ?y) ; Cannot place larger disk on smaller disk
        )
        :effect (and
            (not (on ?d ?p1))
            (not (is-clear ?y))
            (on ?d ?y)
            (is-clear ?p1)
        )
    )

    ; Action 4: Move disk D from Peg P1 to Peg P2 (empty peg)
    (:action move-peg-to-peg
        :parameters (?d - disk ?p1 - peg ?p2 - peg)
        :precondition (and
            (is-clear ?d)
            (on ?d ?p1)
            (is-clear ?p2) ; Target peg must be empty
        )
        :effect (and
            (not (on ?d ?p1))
            (not (is-clear ?p2))
            (on ?d ?p2)
            (is-clear ?p1)
        )
    )