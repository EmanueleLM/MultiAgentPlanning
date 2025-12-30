(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types block)
    (:predicates
        (on ?x - block ?y - block)
        (on-table ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (hand-empty)
    )
    (:functions
        (total-cost) - number
    )

    ;; 1. Pick up block from table
    (:action pick-up
        :parameters (?x - block)
        :precondition (and 
            (clear ?x) 
            (on-table ?x) 
            (hand-empty)
        )
        :effect (and 
            (holding ?x)
            (not (on-table ?x))
            (not (clear ?x))
            (not (hand-empty))
            (increase (total-cost) 1)
        )
    )

    ;; 2. Put down block onto table
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and 
            (on-table ?x)
            (clear ?x)
            (hand-empty)
            (not (holding ?x))
            (increase (total-cost) 1)
        )
    )

    ;; 3. Unstack block A from block B
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
            (increase (total-cost) 1)
        )
    )

    ;; 4. Stack block A onto block B
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
            (increase (total-cost) 1)
        )
    )
)