(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        block - object
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

    ;; Action: Pick up block ?b from the table
    (:action pick-up
        :parameters (?b - block)
        :precondition (and (clear ?b) (ontable ?b) (handempty))
        :effect (and 
            (not (ontable ?b)) 
            (not (clear ?b)) 
            (not (handempty)) 
            (holding ?b) 
            (increase (total-cost) 1)
        )
    )

    ;; Action: Put down block ?b onto the table
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

    ;; Action: Unstack block ?b1 from block ?b2
    (:action unstack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and (on ?b1 ?b2) (clear ?b1) (handempty))
        :effect (and 
            (not (on ?b1 ?b2)) 
            (not (clear ?b1)) 
            (holding ?b1) 
            (not (handempty)) 
            (clear ?b2) 
            (increase (total-cost) 1)
        )
    )

    ;; Action: Stack block ?b1 onto block ?b2
    (:action stack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and (holding ?b1) (clear ?b2))
        :effect (and 
            (on ?b1 ?b2) 
            (clear ?b1) 
            (not (clear ?b2)) 
            (handempty) 
            (not (holding ?b1)) 
            (increase (total-cost) 1)
        )
    )
)