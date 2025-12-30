(define (domain hanoi-4disk)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk 
        peg
    )
    (:predicates
        (on ?d - disk ?x - (either disk peg)) ; d is immediately on x
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
        (clear ?x - (either disk peg)) ; x has nothing on top of it
    )
    (:functions ((total-cost)))
    
    ; 1. Move D from Peg P1 to Peg P2
    (:action move-p-to-p
        :parameters (?d - disk ?p1 - peg ?p2 - peg)
        :precondition (and
            (on ?d ?p1)
            (clear ?d)
            (clear ?p2)
            (not (= ?p1 ?p2))
        )
        :effect (and
            (not (on ?d ?p1))
            (on ?d ?p2)
            (clear ?p1)
            (not (clear ?p2))
            (increase (total-cost) 1)
        )
    )

    ; 2. Move D from Peg P1 to Disk D_target
    (:action move-p-to-d
        :parameters (?d - disk ?p1 - peg ?d_target - disk)
        :precondition (and
            (on ?d ?p1)
            (clear ?d)
            (clear ?d_target)
            (smaller ?d ?d_target)
        )
        :effect (and
            (not (on ?d ?p1))
            (on ?d ?d_target)
            (clear ?p1)
            (not (clear ?d_target))
            (increase (total-cost) 1)
        )
    )
    
    ; 3. Move D from Disk D1 to Peg P2
    (:action move-d-to-p
        :parameters (?d - disk ?d1 - disk ?p2 - peg)
        :precondition (and
            (on ?d ?d1)
            (clear ?d)
            (clear ?p2)
        )
        :effect (and
            (not (on ?d ?d1))
            (on ?d ?p2)
            (clear ?d1)
            (not (clear ?p2))
            (increase (total-cost) 1)
        )
    )

    ; 4. Move D from Disk D1 to Disk D_target
    (:action move-d-to-d
        :parameters (?d - disk ?d1 - disk ?d_target - disk)
        :precondition (and
            (on ?d ?d1)
            (clear ?d)
            (clear ?d_target)
            (smaller ?d ?d_target)
        )
        :effect (and
            (not (on ?d ?d1))
            (on ?d ?d_target)
            (clear ?d1)
            (not (clear ?d_target))
            (increase (total-cost) 1)
        )
    )
)