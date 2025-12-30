(define (domain hanoi)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        item
        disk - item
        peg - item
    )
    (:predicates
        (on ?d - disk ?b - item) ; d is directly on base b (disk or peg)
        (clear ?x - item)        ; x is the topmost item (disk or peg if empty)
        (smaller ?d1 - disk ?d2 - disk) ; d1 is strictly smaller than d2
    )
    (:functions
        (total-cost)
    )

    ; Action 1: Move Disk D from Disk B_from to Disk B_to (Disk onto Disk)
    (:action move-d-to-d
        :parameters (?d - disk ?b_from - disk ?b_to - disk)
        :precondition (and
            (on ?d ?b_from)
            (clear ?d)
            (clear ?b_to)
            (smaller ?d ?b_to) ; Constraint: D must be smaller than the disk it moves onto
        )
        :effect (and
            (not (on ?d ?b_from))
            (on ?d ?b_to)
            (clear ?b_from)
            (not (clear ?b_to))
            (increase (total-cost) 1)
        )
    )

    ; Action 2: Move Disk D from Disk B_from to Peg P_to (Disk onto Peg)
    (:action move-d-to-p
        :parameters (?d - disk ?b_from - disk ?p_to - peg)
        :precondition (and
            (on ?d ?b_from)
            (clear ?d)
            (clear ?p_to) ; Target peg must be empty
        )
        :effect (and
            (not (on ?d ?b_from))
            (on ?d ?p_to)
            (clear ?b_from)
            (not (clear ?p_to))
            (increase (total-cost) 1)
        )
    )

    ; Action 3: Move Disk D from Peg P_from to Disk B_to (Peg onto Disk)
    (:action move-p-to-d
        :parameters (?d - disk ?p_from - peg ?b_to - disk)
        :precondition (and
            (on ?d ?p_from)
            (clear ?d)
            (clear ?b_to)
            (smaller ?d ?b_to) ; Constraint: D must be smaller than the disk it moves onto
        )
        :effect (and
            (not (on ?d ?p_from))
            (on ?d ?b_to)
            (clear ?p_from)
            (not (clear ?b_to))
            (increase (total-cost) 1)
        )
    )

    ; Action 4: Move Disk D from Peg P_from to Peg P_to (Peg onto Peg)
    (:action move-p-to-p
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (on ?d ?p_from)
            (clear ?d)
            (clear ?p_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on ?d ?p_from))
            (on ?d ?p_to)
            (clear ?p_from)
            (not (clear ?p_to))
            (increase (total-cost) 1)
        )
    )
)