(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types block)

    (:predicates
        (on ?b1 - block ?b2 - block)
        (ontable ?b - block)
        (clear ?b - block)
        (handempty)
        (holding ?b - block)
    )

    (:functions
        (total-cost)
    )

    (:action pick-up
        :parameters (?b - block)
        :precondition (and (clear ?b) (ontable ?b) (handempty))
        :effect (and (not (ontable ?b)) (not (clear ?b)) (not (handempty)) (holding ?b) (increase (total-cost) 1))
    )

    (:action put-down
        :parameters (?b - block)
        :precondition (holding ?b)
        :effect (and (not (holding ?b)) (handempty) (ontable ?b) (clear ?b) (increase (total-cost) 1))
    )

    (:action unstack
        :parameters (?b - block ?c - block)
        :precondition (and (on ?b ?c) (clear ?b) (handempty))
        :effect (and (not (on ?b ?c)) (not (clear ?b)) (not (handempty)) (holding ?b) (clear ?c) (increase (total-cost) 1))
    )

    (:action stack
        :parameters (?b - block ?c - block)
        :precondition (and (holding ?b) (clear ?c))
        :effect (and (not (holding ?b)) (not (clear ?c)) (handempty) (on ?b ?c) (clear ?b) (increase (total-cost) 1))
    )
)