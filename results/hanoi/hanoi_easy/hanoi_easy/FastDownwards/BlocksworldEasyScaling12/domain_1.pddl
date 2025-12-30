(define (domain hanoi-4disk)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg - object
    )
    (:predicates
        (on ?d - disk ?l - (either disk peg))
        (clear ?l - (either disk peg)) ; L is clear if nothing is resting on it
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
    )
    
    (:functions
        (total-cost) - number
    )

    (:action move
        :parameters (?d - disk ?l1 - (either disk peg) ?l2 - (either disk peg))
        :precondition (and
            (on ?d ?l1)           ; D is on L1
            (clear ?d)            ; D must be the top disk being moved
            (clear ?l2)           ; L2 must be clear to receive D
            (not (= ?l1 ?l2))     ; Cannot move to the same location
            
            ; Size constraint enforcement: D must be smaller than L2 if L2 is a disk
            (or
                (peg ?l2)                      ; Case 1: L2 is a peg (always valid recipient)
                (and (disk ?l2) (smaller ?d ?l2)) ; Case 2: L2 is a disk, and D is smaller than L2
            )
        )
        :effect (and
            (not (on ?d ?l1))
            (on ?d ?l2)
            
            (clear ?l1)           ; L1 (what D was resting on) is now clear
            (not (clear ?l2))     ; L2 (what D rests on) is now covered
            
            (increase (total-cost) 1)
        )
    )
)