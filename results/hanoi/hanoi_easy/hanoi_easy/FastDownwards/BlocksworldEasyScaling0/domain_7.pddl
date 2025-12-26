(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions)
    (:types block - object)

    (:predicates
        (on ?b1 - block ?b2 - block)
        (on_table ?b - block)
        (clear ?b - block)
        (holding ?b - block)
        (hand_empty)
    )

    (:action pick-up
        :parameters (?b - block)
        :precondition (and (on_table ?b) (clear ?b) (hand_empty))
        :effect (and (not (on_table ?b)) (not (clear ?b)) (not (hand_empty)) (holding ?b))
    )

    (:action unstack
        :parameters (?a - block ?b - block)
        :precondition (and (on ?a ?b) (clear ?a) (hand_empty))
        :effect (and (not (on ?a ?b)) (not (clear ?a)) (clear ?b) (not (hand_empty)) (holding ?a))
    )

    (:action put-down
        :parameters (?b - block)
        :precondition (holding ?b)
        :effect (and (on_table ?b) (clear ?b) (hand_empty) (not (holding ?b)))
    )

    (:action stack
        :parameters (?a - block ?b - block)
        :precondition (and (holding ?a) (clear ?b))
        :effect (and (on ?a ?b) (clear ?a) (not (clear ?b)) (hand_empty) (not (holding ?a)))
    )
)