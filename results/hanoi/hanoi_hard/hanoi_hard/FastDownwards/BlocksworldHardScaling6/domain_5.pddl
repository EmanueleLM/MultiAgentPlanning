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
        (total-cost)
    )

    ;; 1. PICK UP: Take a clear block from the table
    (:action pick-up
        :parameters (?x - block)
        :precondition (and 
            (clear ?x) 
            (ontable ?x) 
            (handempty)
        )
        :effect (and 
            (not (ontable ?x)) 
            (not (clear ?x))
            (not (handempty))
            (holding ?x)
            (increase (total-cost) 1)
        )
    )

    ;; 2. PUT DOWN: Put a held block onto the table
    (:action put-down
        :parameters (?x - block)
        :precondition (and 
            (holding ?x)
        )
        :effect (and 
            (not (holding ?x))
            (handempty)
            (ontable ?x)
            (clear ?x)
            (increase (total-cost) 1)
        )
    )

    ;; 3. UNSTACK: Take a block off another block
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (on ?x ?y) 
            (clear ?x) 
            (handempty)
        )
        :effect (and 
            (not (on ?x ?y))
            (not (clear ?x))
            (not (handempty))
            (holding ?x)
            (clear ?y)
            (increase (total-cost) 1)
        )
    )

    ;; 4. STACK: Put a held block onto a clear block
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (holding ?x) 
            (clear ?y)
        )
        :effect (and 
            (not (holding ?x))
            (not (clear ?y))
            (handempty)
            (on ?x ?y)
            (clear ?x)
            (increase (total-cost) 1)
        )
    )
)