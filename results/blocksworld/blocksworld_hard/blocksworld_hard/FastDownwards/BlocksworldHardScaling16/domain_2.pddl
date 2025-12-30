(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        block
    )
    (:predicates
        (on ?x - block ?y - block)
        (clear ?x - block)
        (ontable ?x - block)
        (holding ?x - block)
        (handempty)
    )

    (:functions (total-cost))

    (:action pick-up
        :parameters (?x - block)
        :precondition (and (clear ?x) (ontable ?x) (handempty))
        :effect (and (not (ontable ?x)) (not (handempty)) (holding ?x) (increase (total-cost) 1))
    )

    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and (ontable ?x) (clear ?x) (handempty) (not (holding ?x)) (increase (total-cost) 1))
    )

    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and (on ?x ?y) (clear ?x) (handempty))
        :effect (and (holding ?x) (clear ?y) (not (on ?x ?y)) (not (handempty)) (increase (total-cost) 1))
    )

    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and (holding ?x) (clear ?y))
        :effect (and (on ?x ?y) (clear ?x) (handempty) (not (holding ?x)) (not (clear ?y)) (increase (total-cost) 1))
    )
)