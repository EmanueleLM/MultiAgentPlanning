(define (domain hanoi-4disk)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)         ; d1 is stacked immediately on d2
        (on-peg ?d - disk ?p - peg)        ; d is the lowest disk on peg p
        (clear ?d - disk)                  ; d has nothing stacked on it
        (peg-clear ?p - peg)               ; p has no disks (base is available)
        (smaller ?d1 - disk ?d2 - disk)    ; d1 is smaller than d2 (static constraint)
    )

    (:functions
        (total-cost) - number
    )

    ;; Action 1: Move disk D from D_under to D_target (within stack moves)
    (:action move-d-d
        :parameters (?d - disk ?d_under - disk ?d_target - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear ?d)
            (clear ?d_target)
            (smaller ?d ?d_target)
            (on ?d ?d_under)
            (not (= ?p_from ?p_to)) 
        )
        :effect (and
            (on ?d ?d_target)
            (not (on ?d ?d_under))
            (clear ?d_under)
            (not (clear ?d_target))
            (increase (total-cost) 1)
        )
    )

    ;; Action 2: Move disk D from D_under to P_to (placing D onto an empty peg)
    (:action move-d-p-from-disk
        :parameters (?d - disk ?d_under - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear ?d)
            (peg-clear ?p_to)
            (on ?d ?d_under)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (on-peg ?d ?p_to)
            (not (on ?d ?d_under))
            (clear ?d_under)
            (not (peg-clear ?p_to))
            (increase (total-cost) 1)
        )
    )
    
    ;; Action 3: Move disk D from P_from (base disk) to D_target
    (:action move-d-d-from-peg
        :parameters (?d - disk ?d_target - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear ?d)
            (clear ?d_target)
            (smaller ?d ?d_target)
            (on-peg ?d ?p_from)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (on ?d ?d_target)
            (not (on-peg ?d ?p_from))
            (peg-clear ?p_from)
            (not (clear ?d_target))
            (increase (total-cost) 1)
        )
    )

    ;; Action 4: Move disk D from P_from (base disk) to P_to (empty peg base to empty peg base)
    (:action move-d-p-from-peg
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear ?d)
            (peg-clear ?p_to)
            (on-peg ?d ?p_from)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (on-peg ?d ?p_to)
            (not (peg-clear ?p_to))
            (peg-clear ?p_from)
            (increase (total-cost) 1)
        )
    )
)