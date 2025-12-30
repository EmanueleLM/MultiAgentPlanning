(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions)
    (:types block)
    (:predicates
        (on ?x - block ?y - block)
        (on_table ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (hand_empty)
    )

    (:action pickup
        :parameters (?x - block)
        :precondition (and 
            (hand_empty)
            (on_table ?x)
            (clear ?x)
        )
        :effect (and 
            (holding ?x)
            (not (hand_empty))
            (not (on_table ?x))
            ; Block is no longer clear because it is picked up/held.
            (not (clear ?x)) 
        )
    )

    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (hand_empty)
            (on ?x ?y)
            (clear ?x)
        )
        :effect (and 
            (holding ?x)
            (clear ?y)
            (not (hand_empty))
            (not (on ?x ?y))
            ; Block is no longer clear because it is picked up/held.
            (not (clear ?x))
        )
    )

    (:action putdown
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and 
            (hand_empty)
            (on_table ?x)
            ; Block is now clear, resting on the table.
            (clear ?x)
            (not (holding ?x))
        )
    )

    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (holding ?x)
            (clear ?y)
        )
        :effect (and 
            (hand_empty)
            (on ?x ?y)
            ; X is now clear (it's the top block)
            (clear ?x) 
            (not (holding ?x))
            ; Y is no longer clear
            (not (clear ?y))
        )
    )
)