(define (domain hanoi-6-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk
        peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)      ; d1 is immediately on d2
        (on-peg ?d - disk ?p - peg)     ; d is the bottom disk on peg p
        (clear ?x - disk)               ; x is the top disk in its stack
        (empty ?p - peg)                ; p has no disks on it
        (smaller ?d1 - disk ?d2 - disk) ; d1 < d2 (static)
    )
    (:functions
        (total-cost)
    )

    ; Action 1: Move D from T_Source (Disk) to T_Dest (Disk)
    (:action move_d_disk_to_disk
        :parameters (?d - disk ?t_s - disk ?t_d - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?t_s)
            (clear ?t_d)
            (smaller ?d ?t_d) ; Hanoi Rule 3: D must be smaller than T_D
        )
        :effect (and
            (not (on ?d ?t_s))
            (not (clear ?t_d))
            (on ?d ?t_d)
            (clear ?t_s)
            (increase (total-cost) 1)
        )
    )

    ; Action 2: Move D from T_Source (Disk) to Empty Peg P_Dest
    (:action move_d_disk_to_peg
        :parameters (?d - disk ?t_s - disk ?p_d - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?t_s)
            (empty ?p_d)
        )
        :effect (and
            (not (on ?d ?t_s))
            (not (empty ?p_d))
            (on-peg ?d ?p_d)
            (clear ?t_s)
            (increase (total-cost) 1)
        )
    )

    ; Action 3: Move D from Peg P_Source to T_Dest (Disk)
    ; D is the base disk on P_S. P_S becomes empty.
    (:action move_d_peg_to_disk
        :parameters (?d - disk ?p_s - peg ?t_d - disk)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?p_s)
            (clear ?t_d)
            (smaller ?d ?t_d) ; Hanoi Rule 3: D must be smaller than T_D
        )
        :effect (and
            (not (on-peg ?d ?p_s))
            (not (clear ?t_d))
            (on ?d ?t_d)
            (empty ?p_s)
            (increase (total-cost) 1)
        )
    )
    
    ; Action 4: Move D from Peg P_Source to Empty Peg P_Dest
    ; D is the base disk on P_S. P_S becomes empty.
    (:action move_d_peg_to_peg
        :parameters (?d - disk ?p_s - peg ?p_d - peg)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?p_s)
            (empty ?p_d)
        )
        :effect (and
            (not (on-peg ?d ?p_s))
            (not (empty ?p_d))
            (on-peg ?d ?p_d)
            (empty ?p_s)
            (increase (total-cost) 1)
        )
    )
)