(define (domain Blocksworld)
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
        (total-cost) - number
    )

    ;; 1. PICK UP: Block from Table
    (action pick-up
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

    ;; 2. PUT DOWN: Block onto Table
    (action put-down
        :parameters (?b - block)
        :precondition (and
            (holding ?b)
        )
        :effect (and
            (ontable ?b)
            (clear ?b)
            (handempty)
            (not (holding ?b))
            (increase (total-cost) 1)
        )
    )
    
    ;; 3. UNSTACK: Block from Block
    (action unstack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and
            (on ?b1 ?b2)
            (clear ?b1)
            (handempty)
        )
        :effect (and
            (holding ?b1)
            (clear ?b2)
            (not (on ?b1 ?b2))
            (not (clear ?b1))
            (not (handempty))
            (increase (total-cost) 1)
        )
    )
    
    ;; 4. STACK: Block onto Block
    (action stack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and
            (holding ?b1)
            (clear ?b2)
        )
        :effect (and
            (on ?b1 ?b2)
            (clear ?b1)
            (handempty)
            (not (holding ?b1))
            (not (clear ?b2))
            (increase (total-cost) 1)
        )
    )
)