(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types block)

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

    (:action pick-up
        :parameters (?b - block)
        :precondition (and (clear ?b) (ontable ?b) (handempty))
        :effect (and (not (ontable ?b))
                     (holding ?b)
                     (not (handempty))
                     (increase (total-cost) 1)
        )
    )
    
    (:action put-down
        :parameters (?b - block)
        :precondition (holding ?b)
        :effect (and (ontable ?b)
                     (clear ?b)
                     (handempty)
                     (not (holding ?b))
                     (increase (total-cost) 1)
        )
    )

    (:action unstack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and (on ?b1 ?b2) (clear ?b1) (handempty) (not (= ?b1 ?b2)))
        :effect (and (holding ?b1)
                     (clear ?b2)
                     (not (on ?b1 ?b2))
                     (not (handempty))
                     (increase (total-cost) 1)
        )
    )

    (:action stack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and (holding ?b1) (clear ?b2) (not (= ?b1 ?b2)))
        :effect (and (on ?b1 ?b2)
                     (clear ?b1)
                     (not (clear ?b2))
                     (handempty)
                     (not (holding ?b1))
                     (increase (total-cost) 1)
        )
    )
)