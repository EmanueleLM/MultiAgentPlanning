(define (domain hanoi-6-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk - object
        peg - object
    )

    (:predicates
        (on ?d1 - disk ?d2 - disk)
        (on-peg ?d - disk ?p - peg)
        (clear ?x - object) ; Used for both clear disks and empty pegs
        (smaller ?d1 - disk ?d2 - disk)
        (loc ?d - disk ?p - peg) ; Tracks which peg a disk is currently on
    )
    
    (:functions
        (total-cost)
    )

    (:action move-d-from-d-to-d
        :parameters (?d - disk ?b - disk ?t - disk ?from - peg ?to - peg)
        :precondition (and
            ; D is the top disk, supported by B
            (on ?d ?b)
            (clear ?d)
            ; T is the target disk, must be clear
            (clear ?t)
            ; Size constraint: D must be smaller than T
            (smaller ?d ?t)
            ; Location tracking
            (loc ?d ?from)
            (loc ?b ?from)
            (loc ?t ?to)
            ; Cannot move to the same peg
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

    (:action move-d-from-d-to-p
        :parameters (?d - disk ?b - disk ?p - peg ?from - peg)
        :precondition (and
            ; D is the top disk, supported by B
            (on ?d ?b)
            (clear ?d)
            ; P is the target peg, must be empty
            (clear ?p)
            ; Location tracking
            (loc ?d ?from)
            (loc ?b ?from)
            ; Cannot move to the same peg
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
    
    (:action move-d-from-p-to-d
        :parameters (?d - disk ?f - peg ?t - disk ?to - peg)
        :precondition (and
            ; D is the only disk on F (since D must be clear and on-peg)
            (on-peg ?d ?f)
            (clear ?d)
            ; T is the target disk, must be clear
            (clear ?t)
            ; Size constraint: D must be smaller than T
            (smaller ?d ?t)
            ; Location tracking
            (loc ?d ?f)
            (loc ?t ?to)
            ; Cannot move to the same peg
            (not (= ?f ?to))
        )
        :effect (and
            (not (on-peg ?d ?f))
            (clear ?f) ; F becomes clear since D was the only disk
            (on ?d ?t)
            (not (clear ?t))
            (not (loc ?d ?f))
            (loc ?d ?to)
            (increase (total-cost) 1)
        )
    )

    (:action move-d-from-p-to-p
        :parameters (?d - disk ?f - peg ?p - peg)
        :precondition (and
            ; D is the only disk on F
            (on-peg ?d ?f)
            (clear ?d)
            ; P must be empty
            (clear ?p)
            ; Location tracking
            (loc ?d ?f)
            ; Cannot move to the same peg
            (not (= ?f ?p))
        )
        :effect (and
            (not (on-peg ?d ?f))
            (on-peg ?d ?p)
            (clear ?f) ; F becomes clear
            (not (clear ?p)) ; P is no longer clear
            (not (loc ?d ?f))
            (loc ?d ?p)
            (increase (total-cost) 1)
        )
    )
)