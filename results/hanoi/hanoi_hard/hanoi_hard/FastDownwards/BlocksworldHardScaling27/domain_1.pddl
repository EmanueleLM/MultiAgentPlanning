(define (domain Blocksworld)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        block
    )
    (:predicates
        (on ?x - block ?y - block)
        (ontable ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (handempty)
    )
    (:functions
        (total-cost) - number
    )

    (:action pick_up
        :parameters (?x - block)
        :precondition (and (clear ?x) (ontable ?x) (handempty))
        :effect (and (not (ontable ?x))
                     (not (clear ?x))
                     (holding ?x)
                     (not (handempty))
                     (increase (total-cost) 1)
        )
    )

    (:action put_down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and (ontable ?x)
                     (clear ?x)
                     (not (holding ?x))
                     (handempty)
                     (increase (total-cost) 1)
        )
    )

    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and (on ?x ?y) (clear ?x) (handempty))
        :effect (and (not (on ?x ?y))
                     (not (clear ?x))
                     (clear ?y)
                     (holding ?x)
                     (not (handempty))
                     (increase (total-cost) 1)
        )
    )

    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and (holding ?x) (clear ?y))
        :effect (and (on ?x ?y)
                     (clear ?x)
                     (not (clear ?y))
                     (not (holding ?x))
                     (handempty)
                     (increase (total-cost) 1)
        )
    )
)