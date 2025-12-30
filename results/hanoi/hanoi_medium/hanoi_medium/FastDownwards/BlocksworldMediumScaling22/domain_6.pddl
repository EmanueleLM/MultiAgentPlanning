(define (domain blocksworld-medium-scaling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        block
    )
    (:predicates
        (on ?x - block ?y - block)
        (on_table ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (hand_empty)
    )

    (:action pick_up
        :parameters (?x - block)
        :precondition (and 
            (clear ?x)
            (on_table ?x)
            (hand_empty)
        )
        :effect (and 
            (holding ?x)
            (not (on_table ?x))
            (not (hand_empty))
        )
    )

    (:action put_down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and 
            (on_table ?x)
            (clear ?x)
            (hand_empty)
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
            (on ?x ?y)
            (clear ?x)
            (hand_empty)
            (not (holding ?x))
            (not (clear ?y))
        )
    )

    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (on ?x ?y)
            (clear ?x)
            (hand_empty)
        )
        :effect (and 
            (holding ?x)
            (clear ?y)
            (not (on ?x ?y))
            (not (hand_empty))
        )
    )
)