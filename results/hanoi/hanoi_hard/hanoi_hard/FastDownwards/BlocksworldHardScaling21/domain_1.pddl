(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types block - object)
    (:predicates
        (on ?x - block ?y - block)
        (on-table ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (hand-empty)
    )
    (:functions ((total-cost)))

    (:action pick-up
        :parameters (?x - block)
        :precondition (and (clear ?x) (on-table ?x) (hand-empty))
        :effect (and (not (on-table ?x)) (holding ?x) (not (hand-empty)) (increase (total-cost) 1))
    )

    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and (on-table ?x) (clear ?x) (not (holding ?x)) (hand-empty) (increase (total-cost) 1))
    )

    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and (on ?x ?y) (clear ?x) (hand-empty))
        :effect (and (not (on ?x ?y)) (clear ?y) (holding ?x) (not (hand-empty)) (increase (total-cost) 1))
    )

    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and (holding ?x) (clear ?y))
        :effect (and (on ?x ?y) (not (clear ?y)) (not (holding ?x)) (hand-empty) (increase (total-cost) 1))
    )
)