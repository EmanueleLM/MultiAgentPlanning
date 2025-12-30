(define (domain hanoi-5-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg - object
    )
    (:predicates
        (on ?d1 - disk ?x2 - object) ; x2 can be a disk or a peg
        (clear ?x - object)          ; x can be a disk or a peg
        (smaller ?d1 - disk ?d2 - disk)
    )
    (:functions
        (total-cost)
    )

    ; Action 1: Move disk ?d onto the base of peg ?p
    (:action move-onto-peg
        :parameters (?d - disk ?x - object ?p - peg)
        :precondition (and
            ; Source constraints: ?d must be clear and resting on ?x
            (on ?d ?x)
            (clear ?d)
            
            ; Destination constraints: Peg base ?p must be clear
            (clear ?p)
        )
        :effect (and
            (not (on ?d ?x))
            (on ?d ?p)
            (clear ?x)
            (not (clear ?p))
            (increase (total-cost) 1)
        )
    )
    
    ; Action 2: Move disk ?d onto disk ?d_under
    (:action move-onto-disk
        :parameters (?d - disk ?x - object ?d_under - disk)
        :precondition (and
            ; Source constraints: ?d must be clear and resting on ?x
            (on ?d ?x)
            (clear ?d)
            
            ; Destination constraints: ?d_under must be clear
            (clear ?d_under)
            
            ; Size rule: ?d must be smaller than ?d_under
            (smaller ?d ?d_under)
        )
        :effect (and
            (not (on ?d ?x))
            (on ?d ?d_under)
            (clear ?x)
            (not (clear ?d_under))
            (increase (total-cost) 1)
        )
    )
)