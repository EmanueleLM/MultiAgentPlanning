(define (domain hanoi-5-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg - object
    )
    (:predicates
        ; ?x can be a disk or a peg
        (on ?d - disk ?x - object) 
        ; ?x is the topmost object in a stack and can receive a disk (if ?x is a peg or larger disk) or be moved (if ?x is a disk)
        (clear ?x - object)
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (static constraint)
    )

    (:functions
        (total-cost) - number
    )

    ;; Action 1: Move Disk onto Peg. Pegs are considered infinitely large, so no size check needed.
    (:action move_to_peg
        :parameters (?d - disk ?l1 - object ?p2 - peg)
        :precondition (and
            (on ?d ?l1)
            (clear ?d)
            (clear ?p2)
        )
        :effect (and
            (not (on ?d ?l1))
            (on ?d ?p2)
            (clear ?l1)
            (not (clear ?p2))
            (increase (total-cost) 1)
        )
    )

    ;; Action 2: Move Disk onto Disk. Requires the disk being moved (?d1) to be smaller than the target disk (?d2).
    (:action move_to_disk
        :parameters (?d1 - disk ?l1 - object ?d2 - disk)
        :precondition (and
            (on ?d1 ?l1)
            (clear ?d1)
            (clear ?d2)
            (smaller ?d1 ?d2) ; Size constraint enforcement
        )
        :effect (and
            (not (on ?d1 ?l1))
            (on ?d1 ?d2)
            (clear ?l1)
            (not (clear ?d2))
            (increase (total-cost) 1)
        )
    )
)