(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions)
    (:types block)
    
    (:predicates
        (on ?x - block ?y - block)
        (on-table ?x - block)
        (clear ?x - block)
        (hand-empty)
        (holding ?x - block)
    )

    ;; Pick up a block from the table. 
    ;; A block is not clear if it is picked up/held.
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
            (not (clear ?b))
            (not (hand-empty))
        )
    )
    
    ;; Unstack a block from another block.
    (:action unstack
        :parameters (?b - block ?x - block)
        :precondition (and 
            (on ?b ?x) 
            (clear ?b) 
            (hand-empty)
        )
        :effect (and 
            (holding ?b)
            (clear ?x)
            (not (on ?b ?x))
            (not (clear ?b))
            (not (hand-empty))
        )
    )
    
    ;; Put down a block onto the table
    (:action put-down
        :parameters (?b - block)
        :precondition (holding ?b)
        :effect (and 
            (on-table ?b)
            (clear ?b) ; Block is no longer picked up and has nothing on it.
            (hand-empty)
            (not (holding ?b))
        )
    )
    
    ;; Stack a block onto another clear block
    (:action stack
        :parameters (?b - block ?x - block)
        :precondition (and 
            (holding ?b)
            (clear ?x)
        )
        :effect (and 
            (on ?b ?x)
            (clear ?b) ; Block placed down is now clear
            (hand-empty)
            (not (clear ?x)) ; Block ?x is no longer clear
            (not (holding ?b))
        )
    )
)