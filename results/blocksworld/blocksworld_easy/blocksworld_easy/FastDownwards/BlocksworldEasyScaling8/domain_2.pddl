(define (domain hanoi-4disk)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        disk peg - object
    )

    (:predicates
        (on ?d - disk ?x - object) ; x can be a disk or a peg
        (clear ?x - object)        ; x can be a disk or a peg
        (smaller ?d1 - disk ?d2 - disk)
    )
    
    (:functions
        (total-cost) - number
    )

    ;; Action 1: Move Disk onto another Disk
    (:action move-onto-disk
        :parameters (?d - disk ?from - object ?d2 - disk)
        :precondition (and
            (clear ?d) 
            (on ?d ?from)
            (clear ?d2)
            (smaller ?d ?d2) ; Size constraint enforced
        )
        :effect (and
            (not (on ?d ?from))
            (on ?d ?d2)
            (not (clear ?d2)) 
            (clear ?from)     
            (increase (total-cost) 1)
        )
    )

    ;; Action 2: Move Disk onto a Peg
    (:action move-to-peg
        :parameters (?d - disk ?from - object ?p - peg)
        :precondition (and
            (clear ?d) 
            (on ?d ?from)
            (clear ?p) ; Peg must be empty
        )
        :effect (and
            (not (on ?d ?from))
            (on ?d ?p)
            (not (clear ?p))
            (clear ?from)     
            (increase (total-cost) 1)
        )
    )
)