(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions)
    (:types block)
    
    (:predicates
        (on ?x - block ?y - block)
        (on-table ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (hand-empty)
    )

    ;; 1. Pick up a block from the table
    (:action pick-up
        :parameters (?x - block)
        :precondition (and 
            (on-table ?x)
            (clear ?x)
            (hand-empty)
        )
        :effect (and 
            (holding ?x)
            (not (on-table ?x))
            (not (clear ?x))
            (not (hand-empty))
        )
    )

    ;; 2. Unstack a block from another block
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (on ?x ?y)
            (clear ?x)
            (hand-empty)
        )
        :effect (and 
            (holding ?x)
            (clear ?y)
            (not (on ?x ?y))
            (not (clear ?x))
            (not (hand-empty))
        )
    )

    ;; 3. Put down a block onto the table
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and 
            (on-table ?x)
            (clear ?x)
            (hand-empty)
            (not (holding ?x))
        )
    )

    ;; 4. Stack a block onto another block
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (holding ?x)
            (clear ?y)
        )
        :effect (and 
            (on ?x ?y)
            (clear ?x)
            (hand-empty)
            (not (holding ?x))
            (not (clear ?y))
        )
    )
)