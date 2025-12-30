(define (domain hanoi-7-disk)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        disk peg
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk) ; d1 is directly on d2
        (on-peg ?d - disk ?p - peg) ; d is the disk immediately resting on peg p (bottom disk)
        (clear ?d - disk) ; d has nothing on it
        (peg-free ?p - peg) ; p has nothing on it
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (Static)
    )

    (:functions
        (total-cost) - number
    )

    ;; 1. Move D resting on disk X, placing D on disk Y (Inter-stack move)
    (:action move_d_x_to_d_y
        :parameters (?d - disk ?x - disk ?y - disk ?p_from - peg ?p_to - peg)
        :precondition (and
            (on ?d ?x)
            (clear ?d)
            (clear ?y)
            (smaller ?d ?y)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (on ?d ?x))
            (on ?d ?y)
            (not (clear ?y))
            (clear ?x)
            (increase (total-cost) 1)
        )
    )
    
    ;; 2. Move D resting on disk X, placing D on empty peg T
    (:action move_d_x_to_peg_t
        :parameters (?d - disk ?x - disk ?t - peg ?p_from - peg)
        :precondition (and
            (on ?d ?x)
            (clear ?d)
            (peg-free ?t)
            (not (= ?p_from ?t))
        )
        :effect (and
            (not (on ?d ?x))
            (on-peg ?d ?t)
            (not (peg-free ?t))
            (clear ?x)
            (increase (total-cost) 1)
        )
    )
    
    ;; 3. Move D (base disk) from peg S, placing D on disk Y
    (:action move_d_s_to_d_y
        :parameters (?d - disk ?s - peg ?y - disk ?p_to - peg)
        :precondition (and
            (on-peg ?d ?s)
            (clear ?d)
            (clear ?y)
            (smaller ?d ?y)
            (not (= ?s ?p_to))
        )
        :effect (and
            (not (on-peg ?d ?s))
            (peg-free ?s)
            (on ?d ?y)
            (not (clear ?y))
            (increase (total-cost) 1)
        )
    )
    
    ;; 4. Move D (base disk) from peg S, placing D on empty peg T
    (:action move_d_s_to_peg_t
        :parameters (?d - disk ?s - peg ?t - peg)
        :precondition (and
            (on-peg ?d ?s)
            (clear ?d)
            (peg-free ?t)
            (not (= ?s ?t))
        )
        :effect (and
            (not (on-peg ?d ?s))
            (on-peg ?d ?t)
            (peg-free ?s)
            (not (peg-free ?t))
            (increase (total-cost) 1)
        )
    )
)