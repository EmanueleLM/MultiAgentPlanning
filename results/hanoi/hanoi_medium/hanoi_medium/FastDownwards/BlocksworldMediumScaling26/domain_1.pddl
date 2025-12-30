(define (domain hanoi-5disks)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        disk peg
    )
    
    (:predicates
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (Static size constraint)
        
        ; Location and stacking
        (on ?d1 - disk ?d2 - disk) ; d1 is immediately on d2
        (on-peg ?d - disk ?p - peg) ; d is the base disk resting on peg p
        
        ; Availability/Clearance
        (is-empty ?p - peg) ; p has no disks
        (clear-disk ?d - disk) ; d has nothing on it (top of stack)
    )

    ; Action 1: Move D from D_below (on P1 stack) to D_target (on P2 stack)
    (:action move-d-from-disk-to-disk
        :parameters (?d - disk ?p1 - peg ?p2 - peg ?d_below - disk ?d_target - disk)
        :precondition (and
            (not (= ?p1 ?p2))
            (smaller ?d ?d_target) ; Constraint: D must be smaller than D_target
            (clear-disk ?d)
            (clear-disk ?d_target)
            (on ?d ?d_below) ; D is sourced from D_below
        )
        :effect (and
            (not (on ?d ?d_below))
            (not (clear-disk ?d_target)) 
            (on ?d ?d_target)
            (clear-disk ?d_below) ; D_below is now exposed
        )
    )

    ; Action 2: Move D from D_below (on P1 stack) to Empty Peg P2
    (:action move-d-from-disk-to-peg-empty
        :parameters (?d - disk ?p1 - peg ?p2 - peg ?d_below - disk)
        :precondition (and
            (not (= ?p1 ?p2))
            (clear-disk ?d)
            (on ?d ?d_below) 
            (is-empty ?p2) ; Target must be empty
        )
        :effect (and
            (not (on ?d ?d_below))
            (not (is-empty ?p2))
            (on-peg ?d ?p2) ; D is now the base disk on P2
            (clear-disk ?d_below) 
        )
    )

    ; Action 3: Move D from Peg P1 (D is base disk) to D_target (on P2 stack)
    (:action move-d-from-peg-to-disk
        :parameters (?d - disk ?p1 - peg ?p2 - peg ?d_target - disk)
        :precondition (and
            (not (= ?p1 ?p2))
            (smaller ?d ?d_target)
            (clear-disk ?d)
            (clear-disk ?d_target)
            (on-peg ?d ?p1) ; D is the base disk on P1
        )
        :effect (and
            (not (on-peg ?d ?p1))
            (not (clear-disk ?d_target))
            (is-empty ?p1) ; P1 becomes empty
            (on ?d ?d_target)
        )
    )

    ; Action 4: Move D from Peg P1 (D is base disk) to Empty Peg P2
    (:action move-d-from-peg-to-peg-empty
        :parameters (?d - disk ?p1 - peg ?p2 - peg)
        :precondition (and
            (not (= ?p1 ?p2))
            (clear-disk ?d)
            (on-peg ?d ?p1)
            (is-empty ?p2)
        )
        :effect (and
            (not (on-peg ?d ?p1))
            (not (is-empty ?p2))
            (is-empty ?p1) 
            (on-peg ?d ?p2)
        )
    )
)