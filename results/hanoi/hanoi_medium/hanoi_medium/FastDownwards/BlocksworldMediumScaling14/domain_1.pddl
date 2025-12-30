(define (domain hanoi-5-disks)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        disk - object
        peg - object
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk) 
        (on-peg ?d - disk ?p - peg)
        (clear ?d - disk)
        (base-clear ?p - peg)
        (smaller ?d1 - disk ?d2 - disk)
    )
    (:functions
        (total-cost) - number
    )

    ; A. Move D from Disk Y onto Disk Z (Disk -> Disk)
    (:action move_d_d_to_d
        :parameters (?d ?y ?z - disk)
        :precondition (and
            (clear ?d)
            (clear ?z)
            (on ?d ?y)
            (smaller ?d ?z) 
        )
        :effect (and
            (not (on ?d ?y))
            (on ?d ?z)
            (not (clear ?z))
            (clear ?y)
            (increase (total-cost) 1)
        )
    )
    
    ; B. Move D from Peg P_from base onto Disk Z (Peg -> Disk)
    (:action move_d_p_to_d
        :parameters (?d ?z - disk ?p_from - peg)
        :precondition (and
            (clear ?d)
            (clear ?z)
            (on-peg ?d ?p_from)
            (smaller ?d ?z) 
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (on ?d ?z)
            (not (clear ?z))
            (base-clear ?p_from)
            (increase (total-cost) 1)
        )
    )

    ; C. Move D from Disk Y onto Peg P_to base (Disk -> Peg)
    (:action move_d_d_to_p
        :parameters (?d ?y - disk ?p_to - peg)
        :precondition (and
            (clear ?d)
            (base-clear ?p_to)
            (on ?d ?y) 
        )
        :effect (and
            (not (on ?d ?y))
            (on-peg ?d ?p_to)
            (not (base-clear ?p_to))
            (clear ?y)
            (increase (total-cost) 1)
        )
    )

    ; D. Move D from Peg P_from base onto Peg P_to base (Peg -> Peg)
    (:action move_d_p_to_p
        :parameters (?d - disk ?p_from ?p_to - peg)
        :precondition (and
            (clear ?d)
            (base-clear ?p_to)
            (on-peg ?d ?p_from)
        )
        :effect (and
            (not (on-peg ?d ?p_from))
            (on-peg ?d ?p_to)
            (not (base-clear ?p_to))
            (base-clear ?p_from)
            (increase (total-cost) 1)
        )
    )
)