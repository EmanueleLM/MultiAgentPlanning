(define (domain Hanoi-6-Disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg
    )
    (:predicates
        (on-disk ?d1 - disk ?d2 - disk) ; d1 immediately on d2
        (on-base ?d - disk ?p - peg)    ; d is the base disk on peg p
        (clear ?d - disk)               ; d is the top disk (can be moved)
        (empty ?p - peg)                ; p has no disks
        (smaller ?d1 - disk ?d2 - disk) ; Static size comparison (d1 < d2)
    )

    (:functions
        (total-cost) - number
    )
    
    ;; 1. Move D from D_Under (disk) onto D_Target (disk)
    (action move-disk-d2d
        :parameters (?d - disk ?d_under - disk ?d_target - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on-disk ?d ?d_under)
            (clear ?d_target)
            (smaller ?d ?d_target) ; D must be smaller than D_Target
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (on-disk ?d ?d_target)
            (clear ?d_under)
            
            (not (on-disk ?d ?d_under))
            (not (clear ?d_target))
            
            (increase (total-cost) 1)
        )
    )

    ;; 2. Move D from D_Under (disk) onto P_Target (empty peg base)
    (action move-disk-d2b
        :parameters (?d - disk ?d_under - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on-disk ?d ?d_under)
            (empty ?p_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (on-base ?d ?p_to) ; D is now the base of P_T
            (clear ?d_under)
            
            (not (on-disk ?d ?d_under))
            (not (empty ?p_to))
            
            (increase (total-cost) 1)
        )
    )
    
    ;; 3. Move D from Base (P_From) onto D_Target (disk)
    (action move-disk-b2d
        :parameters (?d - disk ?d_target - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on-base ?d ?p_from) ; D is base of P_F stack (and only disk)
            (clear ?d_target)
            (smaller ?d ?d_target) ; Size constraint
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (on-disk ?d ?d_target)
            (empty ?p_from) ; P_F becomes empty
            
            (not (on-base ?d ?p_from))
            (not (clear ?d_target))
            
            (increase (total-cost) 1)
        )
    )

    ;; 4. Move D from Base (P_From) onto P_Target (empty peg base)
    (action move-disk-b2b
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on-base ?d ?p_from)
            (empty ?p_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (on-base ?d ?p_to)
            (empty ?p_from) ; P_F becomes empty
            
            (not (on-base ?d ?p_from))
            (not (empty ?p_to))
            
            (increase (total-cost) 1)
        )
    )
)