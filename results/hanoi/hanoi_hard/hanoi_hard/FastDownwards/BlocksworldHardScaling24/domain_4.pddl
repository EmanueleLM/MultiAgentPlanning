(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types block)
    
    (:predicates
        (on ?x - block ?y - block)
        (ontable ?x - block)
        (clear ?x - block)
        (handempty)
        (holding ?x - block)
    )
    
    (:functions
        (total-cost)
    )

    ;; Action: pick-up (from table)
    (:action pick-up
        :parameters (?x - block)
        :precondition (and (clear ?x) (ontable ?x) (handempty))
        :effect (and (not (ontable ?x)) (not (handempty)) (holding ?x) (increase (total-cost) 1))
    )

    ;; Action: put-down (to table)
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and (ontable ?x) (clear ?x) (handempty) (not (holding ?x)) (increase (total-cost) 1))
    )

    ;; Action: unstack (from block)
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and (on ?x ?y) (clear ?x) (handempty))
        :effect (and (holding ?x) (clear ?y) (not (on ?x ?y)) (not (handempty)) (increase (total-cost) 1))
    )

    ;; Action: stack (onto block)
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and (holding ?x) (clear ?y))
        :effect (and (on ?x ?y) (clear ?x) (handempty) (not (clear ?y)) (not (holding ?x)) (increase (total-cost) 1))
    )
)