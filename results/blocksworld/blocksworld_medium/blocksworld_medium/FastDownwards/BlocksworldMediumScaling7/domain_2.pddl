(define (domain blocks-world)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        block - object
    )
    (:predicates
        (on ?b1 - block ?b2 - block)
        (ontable ?b - block)
        (clear ?b - block)
        (holding ?b - block)
        (hand-empty)
    )

    (:action pick-up
        :parameters (?b - block)
        :precondition (and
            (ontable ?b)
            (clear ?b)
            (hand-empty)
        )
        :effect (and
            (holding ?b)
            (not (ontable ?b))
            (not (clear ?b))
            (not (hand-empty))
        )
    )

    (:action unstack
        :parameters (?b - block ?x - block)
        :precondition (and
            (on ?b ?x)
            (clear ?b)
            (hand-empty)
        )
        :effect (and
            (holding ?b)
            (clear ?x)
            (not (on ?b ?x))
            (not (clear ?b))
            (not (hand-empty))
        )
    )

    (:action put-down
        :parameters (?b - block)
        :precondition (holding ?b)
        :effect (and
            (ontable ?b)
            (clear ?b)
            (hand-empty)
            (not (holding ?b))
        )
    )

    (:action stack
        :parameters (?b - block ?x - block)
        :precondition (and
            (holding ?b)
            (clear ?x)
        )
        :effect (and
            (on ?b ?x)
            (clear ?b)
            (hand-empty)
            (not (clear ?x))
            (not (holding ?b))
        )
    )
)