(define (domain blocksworld-medium)
    (:requirements :strips :typing :negative-preconditions)
    (:types block)
    (:predicates
        (on ?x - block ?y - block)
        (ontable ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (hand-empty)
    )

    (:action pick-up
        :parameters (?x - block)
        :precondition (and (clear ?x) (ontable ?x) (hand-empty))
        :effect (and (not (ontable ?x)) (not (clear ?x)) (holding ?x) (not (hand-empty)))
    )

    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and (ontable ?x) (clear ?x) (hand-empty) (not (holding ?x)))
    )

    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and (holding ?x) (clear ?y))
        :effect (and (on ?x ?y) (not (clear ?y)) (clear ?x) (hand-empty) (not (holding ?x)))
    )

    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and (on ?x ?y) (clear ?x) (hand-empty))
        :effect (and (not (on ?x ?y)) (clear ?y) (holding ?x) (not (clear ?x)) (not (hand-empty)))
    )
)