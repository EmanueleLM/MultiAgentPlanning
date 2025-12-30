(define (domain Hanoi-6-Disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg
    )
    (:predicates
        (on-disk ?d1 - disk ?d2 - disk)
        (on-base ?d - disk ?p - peg)
        (is-on ?d - disk ?p - peg)
        (clear ?d - disk)
        (empty ?p - peg)
        (smaller ?d1 - disk ?d2 - disk)
    )

    (:functions
        (total-cost) - number
    )
    
    ;; 1. Move D from stack on P_FROM onto D_Target on P_TO
    (action move-disk-d2d
        :parameters (?d - disk ?d_under - disk ?d_target - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on-disk ?d ?d_under)
            (clear ?d_target)
            (smaller ?d ?d_target)
            (is-on ?d ?p_from)
            (is-on ?d_target ?p_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (on-disk ?d ?d_target)
            (clear ?d_under)
            (is-on ?d ?p_to)
            
            (not (on-disk ?d ?d_under))
            (not (clear ?d_target))
            (not (is-on ?d ?p_from))
            
            (increase (total-cost) 1)
        )
    )

    ;; 2. Move D from stack on P_FROM onto empty P_TO base
    (action move-disk-d2b
        :parameters (?d - disk ?d_under - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on-disk ?d ?d_under)
            (empty ?p_to)
            (is-on ?d ?p_from)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (on-base ?d ?p_to)
            (clear ?d_under)
            (is-on ?d ?p_to)
            
            (not (on-disk ?d ?d_under))
            (not (empty ?p_to))
            (not (is-on ?d ?p_from))
            
            (increase (total-cost) 1)
        )
    )
    
    ;; 3. Move D from P_FROM base onto D_Target on P_TO
    (action move-disk-b2d
        :parameters (?d - disk ?d_target - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on-base ?d ?p_from)
            (clear ?d_target)
            (smaller ?d ?d_target)
            (is-on ?d ?p_from)
            (is-on ?d_target ?p_to)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (on-disk ?d ?d_target)
            (empty ?p_from)
            (is-on ?d ?p_to)
            
            (not (on-base ?d ?p_from))
            (not (clear ?d_target))
            (not (is-on ?d ?p_from))
            
            (increase (total-cost) 1)
        )
    )

    ;; 4. Move D from P_FROM base onto P_TO base
    (action move-disk-b2b
        :parameters (?d - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (clear ?d)
            (on-base ?d ?p_from)
            (empty ?p_to)
            (is-on ?d ?p_from)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (on-base ?d ?p_to)
            (empty ?p_from)
            (is-on ?d ?p_to)
            
            (not (on-base ?d ?p_from))
            (not (empty ?p_to))
            (not (is-on ?d ?p_from))
            
            (increase (total-cost) 1)
        )
    )
)