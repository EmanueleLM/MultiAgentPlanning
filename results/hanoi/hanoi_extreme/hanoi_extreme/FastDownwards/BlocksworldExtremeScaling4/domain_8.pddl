(define (domain hanoi-7d)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg - object
    )

    (:predicates
        (on ?d1 - disk ?d2 - disk) ; d1 is directly on d2
        (clear ?d - disk) ; d is the topmost disk, available to be moved OR placed upon
        (at-base ?d - disk ?p - peg) ; d is the base disk resting on peg p
        (peg-empty ?p - peg) ; p has no disks
        (smaller ?d1 - disk ?d2 - disk) ; d1 size < d2 size (static)
        (on-peg ?d - disk ?p - peg) ; d is currently located on peg p (location tracking)
    )
    
    (:functions
        (total-cost) - number
    )

    ;; Action 1: Move Disk D from Disk D_under (on P_from) onto Disk D_top (on P_to)
    (:action move-d-d
        :parameters (?d - disk ?d_under - disk ?d_top - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?d_under)
            (on-peg ?d ?p_from)         ; D must be on P_from
            (on-peg ?d_top ?p_to)       ; D_top must be on P_to
            (clear ?d_top)
            (smaller ?d ?d_top) ; Enforces size rule
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on ?d ?d_under))
            (clear ?d_under)
            
            (not (on-peg ?d ?p_from))
            (on-peg ?d ?p_to)
            
            (on ?d ?d_top)
            (not (clear ?d_top))
            
            (increase (total-cost) 1)
        )
    )

    ;; Action 2: Move Disk D from Disk D_under (on P_from) onto Peg P_to (empty destination)
    (:action move-d-p
        :parameters (?d - disk ?d_under - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on ?d ?d_under)
            (on-peg ?d ?p_from)         ; D must be on P_from
            (peg-empty ?p_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on ?d ?d_under))
            (clear ?d_under)
            
            (not (on-peg ?d ?p_from))
            (on-peg ?d ?p_to)

            (at-base ?d ?p_to)
            (not (peg-empty ?p_to))
            
            (increase (total-cost) 1)
        )
    )

    ;; Action 3: Move Base Disk D from Peg P_from (source base) onto Disk D_top (on P_to)
    (:action move-p-d
        :parameters (?d - disk ?d_top - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear ?d)
            (at-base ?d ?p_from)
            (on-peg ?d ?p_from)         ; D must be on P_from
            (on-peg ?d_top ?p_to)       ; D_top must be on P_to
            (clear ?d_top)
            (smaller ?d ?d_top) ; Enforces size rule
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (at-base ?d ?p_from))
            (peg-empty ?p_from)
            
            (not (on-peg ?d ?p_from))
            (on-peg ?d ?p_to)

            (on ?d ?d_top)
            (not (clear ?d_top))
            
            (increase (total-cost) 1)
        )
    )

    ;; Action 4: Move Base Disk D from Peg P_from (source base) onto Peg P_to (empty destination)
    (:action move-p-p
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear ?d)
            (at-base ?d ?p_from)
            (on-peg ?d ?p_from)         ; D must be on P_from
            (peg-empty ?p_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (at-base ?d ?p_from))
            (peg-empty ?p_from)
            
            (not (on-peg ?d ?p_from))
            (on-peg ?d ?p_to)

            (at-base ?d ?p_to)
            (not (peg-empty ?p_to))
            
            (increase (total-cost) 1)
        )
    )
)