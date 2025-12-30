```pddl
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
    
    ; Pick up a block from the table
    (:action pick-up
        :parameters (?b - block)
        :precondition (and 
            (on-table ?b)
            (clear ?b)
            (hand-empty)
        )
        :effect (and 
            (holding ?b)
            (not (on-table ?b))
            (not (hand-empty))
            (not (clear ?b)) ; Constraint: Not clear if picked up/held
        )
    )

    ; Unstack a block from another block
    (:action unstack
        :parameters (?b - block ?c - block)
        :precondition (and 
            (on ?b ?c)
            (clear ?b)
            (hand-empty)
        )
        :effect (and 
            (holding ?b)
            (clear ?c)
            (not (on ?b ?c))
            (not (hand-empty))
            (not (clear ?b)) ; Constraint: Not clear if picked up/held
        )
    )

    ; Put down a block onto the table
    (:action put-down
        :parameters (?b - block)
        :precondition (holding ?b)
        :effect (and 
            (on-table ?b)
            (hand-empty)
            (clear ?b) ; Clear when released and on table
            (not (holding ?b))
        )
    )

    ; Stack a block onto another block
    (:action stack
        :parameters (?b - block ?c - block)
        :precondition (and 
            (holding ?b)
            (clear ?c)
        )
        :effect (and 
            (on ?b ?c)
            (hand-empty)
            (clear ?b) ; Clear when released and nothing is on it
            (not (holding ?b))
            (not (clear ?c)) ; Block beneath is no longer clear
        )
    )
)
```