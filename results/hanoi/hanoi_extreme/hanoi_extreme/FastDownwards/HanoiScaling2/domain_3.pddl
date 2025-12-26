(define (domain hanoi_5_disks_optimized)
    (:requirements :strips :typing :negative-preconditions :numeric-fluents :action-costs)
    (:types
        disk peg - object
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)     ; d1 is immediately on top of d2
        (on-peg ?d - disk ?p - peg)    ; d is the base disk on peg p
        (is-clear ?d - disk)           ; d has no disk on top
        (peg-empty ?p - peg)           ; p holds no disks
    )
    (:functions
        (size ?d - disk)               ; Numeric size of the disk (1=smallest)
        (total-cost)
    )

    ; 1. Move D (from D_under) onto D_target
    (:action move-d-from-d-to-d
        :parameters (?d ?d_under ?d_target - disk)
        :precondition (and
            (on ?d ?d_under)
            (is-clear ?d)
            (is-clear ?d_target)
            (< (size ?d) (size ?d_target)) ; Rule: Smaller disk on larger disk
        )
        :effect (and
            (not (on ?d ?d_under))
            (is-clear ?d_under)
            (not (is-clear ?d_target))
            (on ?d ?d_target)
            (increase (total-cost) 1)
        )
    )

    ; 2. Move D (from D_under) onto Empty Peg P2
    (:action move-d-from-d-to-p
        :parameters (?d ?d_under - disk ?p2 - peg)
        :precondition (and
            (on ?d ?d_under)
            (is-clear ?d)
            (peg-empty ?p2)
        )
        :effect (and
            (not (on ?d ?d_under))
            (is-clear ?d_under)
            (not (peg-empty ?p2))
            (on-peg ?d ?p2)
            (increase (total-cost) 1)
        )
    )
    
    ; 3. Move D (from Peg P1, Base disk) onto D_target
    (:action move-d-from-p-to-d
        :parameters (?d ?d_target - disk ?p1 - peg)
        :precondition (and
            (on-peg ?d ?p1)
            (is-clear ?d)
            (is-clear ?d_target)
            (< (size ?d) (size ?d_target)) ; Rule: Smaller disk on larger disk
        )
        :effect (and
            (not (on-peg ?d ?p1))
            (peg-empty ?p1)
            (not (is-clear ?d_target))
            (on ?d ?d_target)
            (increase (total-cost) 1)
        )
    )
    
    ; 4. Move D (from Peg P1, Base disk) onto Empty Peg P2
    (:action move-d-from-p-to-p
        :parameters (?d - disk ?p1 ?p2 - peg)
        :precondition (and
            (on-peg ?d ?p1)
            (is-clear ?d)
            (peg-empty ?p2)
        )
        :effect (and
            (not (on-peg ?d ?p1))
            (peg-empty ?p1)
            (not (peg-empty ?p2))
            (on-peg ?d ?p2)
            (increase (total-cost) 1)
        )
    )
)