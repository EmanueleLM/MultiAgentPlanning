(define (domain hanoi-5disk)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        disk peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)
        (on-peg ?d - disk ?p - peg)
        (disk-clear ?d - disk)
        (peg-clear ?p - peg)
        (smaller ?d1 - disk ?d2 - disk)
    )

    (:action move_d_to_d
        :parameters (?d ?s_b ?t_b - disk)
        :precondition (and
            (on ?d ?s_b)
            (disk-clear ?d)
            (disk-clear ?t_b)
            (smaller ?d ?t_b) ; Disk d must be smaller than disk t_b (the new base)
        )
        :effect (and
            (not (on ?d ?s_b))
            (on ?d ?t_b)
            (disk-clear ?s_b) ; The disk below the moved disk is now clear
            (not (disk-clear ?t_b)) ; The new base is no longer clear
            (increase (total-cost) 1)
        )
    )

    (:action move_d_to_peg
        :parameters (?d ?s_b - disk 
                     ?target - peg
        )
        :precondition (and
            (on ?d ?s_b)
            (disk-clear ?d)
            (peg-clear ?target) ; Target peg must be empty
        )
        :effect (and
            (not (on ?d ?s_b))
            (on-peg ?d ?target)
            (disk-clear ?s_b) ; The disk below the moved disk is now clear
            (not (peg-clear ?target)) ; Target peg is no longer clear
            (increase (total-cost) 1)
        )
    )

    (:action move_peg_to_d
        :parameters (?d ?t_b - disk 
                     ?source - peg
        )
        :precondition (and
            (on-peg ?d ?source)
            (disk-clear ?d)
            (disk-clear ?t_b)
            (smaller ?d ?t_b) ; Disk d must be smaller than disk t_b (the new base)
        )
        :effect (and
            (not (on-peg ?d ?source))
            (on ?d ?t_b)
            (peg-clear ?source) ; Source peg is now clear/empty
            (not (disk-clear ?t_b)) ; The new base is no longer clear
            (increase (total-cost) 1)
        )
    )

    (:action move_peg_to_peg
        :parameters (?d - disk 
                     ?source ?target - peg
        )
        :precondition (and
            (on-peg ?d ?source)
            (disk-clear ?d)
            (peg-clear ?target) ; Target peg must be empty
        )
        :effect (and
            (not (on-peg ?d ?source))
            (on-peg ?d ?target)
            (peg-clear ?source) ; Source peg is now clear/empty
            (not (peg-clear ?target)) ; Target peg is no longer clear
            (increase (total-cost) 1)
        )
    )
)