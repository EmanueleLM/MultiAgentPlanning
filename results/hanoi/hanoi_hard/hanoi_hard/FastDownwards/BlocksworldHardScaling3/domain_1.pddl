(define (domain blocksworld-hard-scaling3)
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

    (:action pick-up
        :parameters (?b - block)
        :precondition (and
            (ontable ?b)
            (clear ?b)
            (handempty)
        )
        :effect (and
            (holding ?b)
            (not (ontable ?b))
            (not (clear ?b))
            (not (handempty))
            (increase (total-cost) 1)
        )
    )

    (:action unstack
        :parameters (?b - block ?c - block)
        :precondition (and
            (on ?b ?c)
            (clear ?b)
            (handempty)
        )
        :effect (and
            (holding ?b)
            (clear ?c)
            (not (on ?b ?c))
            (not (clear ?b))
            (not (handempty))
            (increase (total-cost) 1)
        )
    )

    (:action put-down
        :parameters (?b - block)
        :precondition (holding ?b)
        :effect (and
            (ontable ?b)
            (clear ?b)
            (handempty)
            (not (holding ?b))
            (increase (total-cost) 1)
        )
    )

    (:action stack
        :parameters (?b - block ?c - block)
        :precondition (and
            (holding ?b)
            (clear ?c)
        )
        :effect (and
            (on ?b ?c)
            (clear ?b)
            (handempty)
            (not (clear ?c))
            (not (holding ?b))
            (increase (total-cost) 1)
        )
    )
)