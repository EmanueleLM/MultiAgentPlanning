(define (domain tower-of-hanoi-6-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types 
        disk 
        peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk) ; d1 is immediately on d2
        (on-peg ?d - disk ?p - peg) ; d is immediately on peg p (base)
        (clear ?x - disk) ; x has nothing on top of it
        (peg-empty ?p - peg) ; p has no disks
        (holding ?d - disk)
        (handempty)
        
        ; Static size predicates: d1 is smaller than d2
        (smaller ?d1 - disk ?d2 - disk)
    )
    (:functions
        (total-cost)
    )

    ; 1. Pick up disk D from a peg P (Lifting the bottom disk of a stack)
    (:action lift-from-peg
        :parameters (?d - disk ?p - peg)
        :precondition (and
            (handempty)
            (on-peg ?d ?p)
            (clear ?d)
        )
        :effect (and
            (holding ?d)
            (peg-empty ?p)
            (not (handempty))
            (not (on-peg ?d ?p))
            (not (clear ?d))
            (increase (total-cost) 1)
        )
    )
    
    ; 2. Pick up disk D from another disk D_under (Unstack)
    (:action lift-from-disk
        :parameters (?d - disk ?d_under - disk)
        :precondition (and
            (handempty)
            (on ?d ?d_under)
            (clear ?d)
        )
        :effect (and
            (holding ?d)
            (clear ?d_under)
            (not (handempty))
            (not (on ?d ?d_under))
            (not (clear ?d))
            (increase (total-cost) 1)
        )
    )

    ; 3. Put down disk D onto an empty peg P
    (:action move-to-empty-peg
        :parameters (?d - disk ?p - peg)
        :precondition (and 
            (holding ?d)
            (peg-empty ?p)
        )
        :effect (and
            (on-peg ?d ?p)
            (clear ?d)
            (handempty)
            (not (holding ?d))
            (not (peg-empty ?p))
            (increase (total-cost) 1)
        )
    )

    ; 4. Put down disk D onto another disk D_under (Stack), respecting size constraint
    (:action move-onto-disk
        :parameters (?d - disk ?d_under - disk)
        :precondition (and 
            (holding ?d)
            (clear ?d_under)
            ; Size constraint: D must be smaller than D_under
            (smaller ?d ?d_under)
        )
        :effect (and
            (on ?d ?d_under)
            (clear ?d)
            (handempty)
            (not (holding ?d))
            (not (clear ?d_under))
            (increase (total-cost) 1)
        )
    )
)