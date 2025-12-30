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
            (not (clear ?b)) ; Block is no longer clear when held
        )
    )

    ; Unstack a block from another block
    (:action unstack
        :parameters (?b - block ?c - block)
        :precondition (and 
            (on ?b ?c)
            (clear ?b) ; Must be topmost
            (hand-empty)
        )
        :effect (and 
            (holding ?b)
            (clear ?c) ; Block below is now clear
            (not (on ?b ?c))
            (not (hand-empty))
            (not (clear ?b)) ; Block is no longer clear when held
        )
    )

    ; Put down a block onto the table
    (:action put-down
        :parameters (?b - block)
        :precondition (holding ?b)
        :effect (and 
            (on-table ?b)
            (hand-empty)
            (clear ?b) ; Block becomes clear when placed on the table
            (not (holding ?b))
        )
    )

    ; Stack a block onto another block
    (:action stack
        :parameters (?b - block ?c - block)
        :precondition (and 
            (holding ?b)
            (clear ?c) ; Must stack onto a clear block
        )
        :effect (and 
            (on ?b ?c)
            (hand-empty)
            (clear ?b) ; Block being placed is now clear
            (not (holding ?b))
            (not (clear ?c)) ; Block beneath is no longer clear
        )
    )
)
```