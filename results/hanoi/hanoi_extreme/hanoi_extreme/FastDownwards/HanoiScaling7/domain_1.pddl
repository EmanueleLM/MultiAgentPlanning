(define (domain hanoi-6-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)
        (on-peg ?d - disk ?p - peg)
        (clear ?d - disk)
        (peg-clear ?p - peg)
        (smaller ?d1 - disk ?d2 - disk)
    )
    (:functions
        (total-cost)
    )

    ; 1. Move D from Disk D_source to Disk D_target
    ; Requires D < D_target
    (:action move_d_d_to_d
        :parameters (?d - disk ?d_source - disk ?d_target - disk)
        :precondition (and
            (clear ?d)
            (on ?d ?d_source)
            (clear ?d_target)
            (smaller ?d ?d_target)
        )
        :effect (and
            (not (on ?d ?d_source))
            (clear ?d_source)
            (not (clear ?d_target))
            (on ?d ?d_target)
            (increase (total-cost) 1)
        )
    )

    ; 2. Move D from Disk D_source to Peg P_target (must be empty)
    (:action move_d_d_to_p
        :parameters (?d - disk ?d_source - disk ?p_target - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?d_source)
            (peg-clear ?p_target)
        )
        :effect (and
            (not (on ?d ?d_source))
            (clear ?d_source)
            (not (peg-clear ?p_target))
            (on-peg ?d ?p_target)
            (increase (total-cost) 1)
        )
    )

    ; 3. Move D from Peg P_source (D is the bottom disk) to Disk D_target
    ; Requires D < D_target
    (:action move_d_p_to_d
        :parameters (?d - disk ?p_source - peg ?d_target - disk)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?p_source)
            (clear ?d_target)
            (smaller ?d ?d_target)
        )
        :effect (and
            (not (on-peg ?d ?p_source))
            (peg-clear ?p_source)
            (not (clear ?d_target))
            (on ?d ?d_target)
            (increase (total-cost) 1)
        )
    )

    ; 4. Move D from Peg P_source (D is the bottom disk) to Peg P_target (must be empty)
    (:action move_d_p_to_p
        :parameters (?d - disk ?p_source - peg ?p_target - peg)
        :precondition (and
            (clear ?d)
            (on-peg ?d ?p_source)
            (peg-clear ?p_target)
            (not (= ?p_source ?p_target))
        )
        :effect (and
            (not (on-peg ?d ?p_source))
            (peg-clear ?p_source)
            (not (peg-clear ?p_target))
            (on-peg ?d ?p_target)
            (increase (total-cost) 1)
        )
    )
)