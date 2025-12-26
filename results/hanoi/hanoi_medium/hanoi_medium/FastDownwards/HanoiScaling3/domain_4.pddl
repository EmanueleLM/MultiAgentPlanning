(define (domain hanoi-5disks)
    (:requirements :typing :negative-preconditions :action-costs :numeric-fluents)
    (:types
        disk - object
        peg - object
    )
    
    (:predicates
        ; Positional state representation
        (on_disk ?d1 - disk ?d2 - disk) ; d1 is immediately on d2
        (on_peg ?d - disk ?p - peg)    ; d is the bottom disk resting on peg p
        
        ; Availability/Top Status
        (clear ?d - disk)              ; Nothing is on d
        (peg_clear ?p - peg)           ; Peg p has no disks on it
        
        ; Location tracking 
        (at ?d - disk ?p - peg)
    )

    (:functions
        (total-cost) - number
        (disk-size ?d - disk) - number ; Numerical encoding of size
    )

    ; --- Action 1: Move Disk D from Disk base (D_from) to Disk base (D_to) ---
    (:action move_d_d
        :parameters (?d ?d_from ?d_to - disk ?p_from ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on_disk ?d ?d_from)
            (clear ?d_to)
            (< (disk-size ?d) (disk-size ?d_to)) ; Size constraint check
            (not (= ?p_from ?p_to))
            (at ?d ?p_from)
            (at ?d_from ?p_from)
            (at ?d_to ?p_to)
        )
        :effect (and
            (not (on_disk ?d ?d_from))
            (not (clear ?d_to))
            (not (at ?d ?p_from))

            (on_disk ?d ?d_to)
            (clear ?d_from)
            (at ?d ?p_to)

            (increase (total-cost) 1)
        )
    )

    ; --- Action 2: Move Disk D from Disk base (D_from) to Peg base (P_to) ---
    (:action move_d_p
        :parameters (?d - disk ?d_from - disk ?p_from ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on_disk ?d ?d_from)
            (peg_clear ?p_to)
            (not (= ?p_from ?p_to))
            (at ?d ?p_from)
            (at ?d_from ?p_from)
        )
        :effect (and
            (not (on_disk ?d ?d_from))
            (not (peg_clear ?p_to))
            (not (at ?d ?p_from))

            (on_peg ?d ?p_to)
            (clear ?d_from)
            (at ?d ?p_to)

            (increase (total-cost) 1)
        )
    )

    ; --- Action 3: Move Disk D from Peg base (P_from) to Disk base (D_to) ---
    (:action move_p_d
        :parameters (?d ?d_to - disk ?p_from ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on_peg ?d ?p_from)
            (clear ?d_to)
            (< (disk-size ?d) (disk-size ?d_to)) ; Size constraint check
            (not (= ?p_from ?p_to))
            (at ?d ?p_from)
            (at ?d_to ?p_to)
        )
        :effect (and
            (not (on_peg ?d ?p_from))
            (not (clear ?d_to))
            (not (at ?d ?p_from))

            (on_disk ?d ?d_to)
            (peg_clear ?p_from) ; P_from is now empty
            (at ?d ?p_to)

            (increase (total-cost) 1)
        )
    )

    ; --- Action 4: Move Disk D from Peg base (P_from) to Peg base (P_to) ---
    (:action move_p_p
        :parameters (?d - disk ?p_from ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on_peg ?d ?p_from)
            (peg_clear ?p_to)
            (not (= ?p_from ?p_to))
            (at ?d ?p_from)
        )
        :effect (and
            (not (on_peg ?d ?p_from))
            (not (peg_clear ?p_to))
            (not (at ?d ?p_from))

            (on_peg ?d ?p_to)
            (peg_clear ?p_from)
            (at ?d ?p_to)

            (increase (total-cost) 1)
        )
    )
)