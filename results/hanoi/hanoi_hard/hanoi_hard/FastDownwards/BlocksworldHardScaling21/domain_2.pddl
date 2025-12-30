(define (domain hanoi)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types 
        disk peg - object
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk) ; d1 is immediately on d2
        (on-peg ?d - disk ?p - peg) ; d is the base disk on peg p
        (clear ?d - disk) ; d is the top disk
        (peg-empty ?p - peg) ; p has no disks
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (static constraint)
    )
    (:functions (total-cost))

    ;; A1: Move D from D_under onto D_new_under (Disk to Disk)
    (:action move_d_d
        :parameters (?d - disk ?d_under - disk ?d_new_under - disk)
        :precondition (and 
            (on ?d ?d_under)
            (clear ?d)
            (clear ?d_new_under)
            (smaller ?d ?d_new_under) ; Smaller disk on larger disk rule
        )
        :effect (and 
            (not (on ?d ?d_under))
            (on ?d ?d_new_under)
            (clear ?d_under)
            (not (clear ?d_new_under))
            (increase (total-cost) 1)
        )
    )

    ;; A2: Move D from D_under onto P_new (Disk to Empty Peg)
    (:action move_d_p_empty
        :parameters (?d - disk ?d_under - disk ?p_new - peg)
        :precondition (and 
            (on ?d ?d_under)
            (clear ?d)
            (peg-empty ?p_new)
        )
        :effect (and 
            (not (on ?d ?d_under))
            (on-peg ?d ?p_new)
            (clear ?d_under)
            (not (peg-empty ?p_new))
            (increase (total-cost) 1)
        )
    )

    ;; A3: Move D from P_under onto D_new_under (Base Disk to Disk)
    (:action move_p_d
        :parameters (?d - disk ?p_under - peg ?d_new_under - disk)
        :precondition (and 
            (on-peg ?d ?p_under)
            (clear ?d)
            (clear ?d_new_under)
            (smaller ?d ?d_new_under) ; Smaller disk on larger disk rule
        )
        :effect (and 
            (not (on-peg ?d ?p_under))
            (on ?d ?d_new_under)
            (peg-empty ?p_under)
            (not (clear ?d_new_under))
            (increase (total-cost) 1)
        )
    )

    ;; A4: Move D from P_under onto P_new (Base Disk to Empty Peg)
    (:action move_p_p_empty
        :parameters (?d - disk ?p_under - peg ?p_new - peg)
        :precondition (and 
            (on-peg ?d ?p_under)
            (clear ?d)
            (peg-empty ?p_new)
        )
        :effect (and 
            (not (on-peg ?d ?p_under))
            (on-peg ?d ?p_new)
            (peg-empty ?p_under)
            (not (peg-empty ?p_new))
            (increase (total-cost) 1)
        )
    )
)