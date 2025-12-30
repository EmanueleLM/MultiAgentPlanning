(define (domain hanoi-6-disks-optimized)
    (:requirements :strips :typing :negative-preconditions :action-costs :fluents)
    (:types
        disk - object
        peg - object
    )

    (:predicates
        (on ?d1 - disk ?d2 - disk)
        (on-peg ?d - disk ?p - peg)
        (clear ?x - object) ; Can be a disk or a peg
        (loc ?d - disk ?p - peg) ; Tracks which peg a disk belongs to
    )
    
    (:functions
        (disk-size ?d - disk) ; Size metric 1 (A) to 6 (F)
        (total-cost)
    )

    ; Move disk D from disk B onto disk T (Target disk T must be larger than D)
    (:action move-d-from-d-to-d
        :parameters (?d - disk ?b - disk ?t - disk ?from - peg ?to - peg)
        :precondition (and
            (on ?d ?b)
            (clear ?d)
            (clear ?t)
            ; Size constraint: Disk D must be smaller than disk T
            (< (disk-size ?d) (disk-size ?t))
            (loc ?d ?from)
            (loc ?t ?to)
            (not (= ?from ?to))
        )
        :effect (and
            (not (on ?d ?b))
            (on ?d ?t)
            (clear ?b)
            (not (clear ?t))
            (not (loc ?d ?from))
            (loc ?d ?to)
            (increase (total-cost) 1)
        )
    )

    ; Move disk D from disk B onto empty peg P
    (:action move-d-from-d-to-p
        :parameters (?d - disk ?b - disk ?p - peg ?from - peg)
        :precondition (and
            (on ?d ?b)
            (clear ?d)
            (clear ?p) ; P is clear (empty)
            (loc ?d ?from)
            (not (= ?from ?p))
        )
        :effect (and
            (not (on ?d ?b))
            (on-peg ?d ?p)
            (clear ?b)
            (not (clear ?p)) 
            (not (loc ?d ?from))
            (loc ?d ?p)
            (increase (total-cost) 1)
        )
    )
    
    ; Move disk D from peg F onto disk T (Target disk T must be larger than D)
    (:action move-d-from-p-to-d
        :parameters (?d - disk ?f - peg ?t - disk ?to - peg)
        :precondition (and
            (on-peg ?d ?f)
            (clear ?d)
            (clear ?t)
            ; Size constraint: Disk D must be smaller than disk T
            (< (disk-size ?d) (disk-size ?t))
            (loc ?d ?f)
            (loc ?t ?to)
            (not (= ?f ?to))
        )
        :effect (and
            (not (on-peg ?d ?f))
            (clear ?f)
            (on ?d ?t)
            (not (clear ?t))
            (not (loc ?d ?f))
            (loc ?d ?to)
            (increase (total-cost) 1)
        )
    )

    ; Move disk D from peg F onto empty peg P
    (:action move-d-from-p-to-p
        :parameters (?d - disk ?f - peg ?p - peg)
        :precondition (and
            (on-peg ?d ?f)
            (clear ?d)
            (clear ?p)
            (loc ?d ?f)
            (not (= ?f ?p))
        )
        :effect (and
            (not (on-peg ?d ?f))
            (on-peg ?d ?p)
            (clear ?f)
            (not (clear ?p))
            (not (loc ?d ?f))
            (loc ?d ?p)
            (increase (total-cost) 1)
        )
    )
)