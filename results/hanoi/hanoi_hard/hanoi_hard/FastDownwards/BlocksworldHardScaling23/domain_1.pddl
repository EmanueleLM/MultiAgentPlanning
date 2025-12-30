(define (domain blocksworld-hard)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types block)
    (:predicates
        (on ?b1 - block ?b2 - block)
        (on_table ?b - block)
        (clear ?b - block)
        (holding ?b - block)
        (hand_empty)
    )
    (:functions
        (total-cost) - number
    )

    (:action pick-up
        :parameters (?b - block)
        :precondition (and (on_table ?b) (clear ?b) (hand_empty))
        :effect (and (holding ?b)
                     (not (on_table ?b))
                     (not (hand_empty))
                     (increase (total-cost) 1)
                )
    )

    (:action put-down
        :parameters (?b - block)
        :precondition (holding ?b)
        :effect (and (on_table ?b)
                     (clear ?b)
                     (hand_empty)
                     (not (holding ?b))
                     (increase (total-cost) 1)
                )
    )

    (:action unstack
        :parameters (?b - block ?c - block)
        :precondition (and (on ?b ?c) (clear ?b) (hand_empty))
        :effect (and (holding ?b)
                     (clear ?c)
                     (not (on ?b ?c))
                     (not (hand_empty))
                     (increase (total-cost) 1)
                )
    )

    (:action stack
        :parameters (?b - block ?c - block)
        :precondition (and (holding ?b) (clear ?c))
        :effect (and (on ?b ?c)
                     (hand_empty)
                     (not (holding ?b))
                     (not (clear ?c))
                     (increase (total-cost) 1)
                )
    )
)