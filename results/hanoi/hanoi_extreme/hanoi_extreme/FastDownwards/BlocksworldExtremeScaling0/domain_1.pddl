(define (domain hanoi-7disk)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk 
        peg
    )
    
    (:predicates
        (on ?d - disk ?b - (either disk peg))
        (clear ?x - (either disk peg))
        (smaller ?d1 - disk ?d2 - disk)
        (at-peg ?x - (either disk peg) ?p - peg)
        (is-peg ?p - peg)
    )

    (:functions
        (total-cost)
    )
    
    (:action move
        :parameters (?d - disk ?p1 - peg ?p2 - peg ?b1 - (either disk peg) ?b2 - (either disk peg))
        :precondition (and
            (not (= ?p1 ?p2)) 

            ; 1. Source checks
            (on ?d ?b1)
            (clear ?d)
            (at-peg ?b1 ?p1)
            (at-peg ?d ?p1)

            ; 2. Destination checks
            (clear ?b2)
            (at-peg ?b2 ?p2)
            
            ; 3. Size constraint: D must be smaller than B2 if B2 is a disk.
            (or
                (is-peg ?b2)
                (smaller ?d ?b2)
            )
        )
        :effect (and
            ; Update ON relationships
            (not (on ?d ?b1))
            (on ?d ?b2)
            
            ; Update CLEAR status
            (clear ?b1)
            (not (clear ?b2))
            
            ; Update Location tracking for D
            (not (at-peg ?d ?p1))
            (at-peg ?d ?p2)

            ; Cost increase
            (increase (total-cost) 1)
        )
    )
)