(define (domain Hanoi)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg
    )
    (:predicates
        (on_disk ?d1 - disk ?d2 - disk) ; d1 is on d2
        (on_peg ?d - disk ?p - peg)     ; d is on peg p (at the base)
        (clear ?d - disk)               ; d has nothing on top
        (peg_empty ?p - peg)            ; p has no disks
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (Static fact)
    )
    (:functions
        (total-cost) - number
    )

    ; A: Move disk D from D_base onto D_target (Both are disks)
    (:action move_D_from_D_to_D
        :parameters (?d - disk ?d_base - disk ?d_target - disk)
        :precondition (and
            (on_disk ?d ?d_base)
            (clear ?d)
            (clear ?d_target)
            (smaller ?d ?d_target) ; Cannot place larger disk on smaller disk
        )
        :effect (and
            (not (on_disk ?d ?d_base))
            (on_disk ?d ?d_target)
            (not (clear ?d_target))
            (clear ?d_base)
            (increase (total-cost) 1)
        )
    )

    ; B: Move disk D from D_base onto P_target (Disk onto empty peg)
    (:action move_D_from_D_to_P
        :parameters (?d - disk ?d_base - disk ?p_target - peg)
        :precondition (and
            (on_disk ?d ?d_base)
            (clear ?d)
            (peg_empty ?p_target)
        )
        :effect (and
            (not (on_disk ?d ?d_base))
            (on_peg ?d ?p_target)
            (not (peg_empty ?p_target))
            (clear ?d_base)
            (increase (total-cost) 1)
        )
    )
    
    ; C: Move disk D from P_base onto D_target (Peg base disk onto another disk)
    (:action move_D_from_P_to_D
        :parameters (?d - disk ?p_base - peg ?d_target - disk)
        :precondition (and
            (on_peg ?d ?p_base)
            (clear ?d)
            (clear ?d_target)
            (smaller ?d ?d_target) ; Cannot place larger disk on smaller disk
        )
        :effect (and
            (not (on_peg ?d ?p_base))
            (on_disk ?d ?d_target)
            (not (clear ?d_target))
            (peg_empty ?p_base) 
            (increase (total-cost) 1)
        )
    )
    
    ; D: Move disk D from P_base onto P_target (Peg base disk onto another empty peg)
    (:action move_D_from_P_to_P
        :parameters (?d - disk ?p_base - peg ?p_target - peg)
        :precondition (and
            (on_peg ?d ?p_base)
            (clear ?d)
            (peg_empty ?p_target)
            (not (= ?p_base ?p_target))
        )
        :effect (and
            (not (on_peg ?d ?p_base))
            (on_peg ?d ?p_target)
            (not (peg_empty ?p_target))
            (peg_empty ?p_base)
            (increase (total-cost) 1)
        )
    )
)