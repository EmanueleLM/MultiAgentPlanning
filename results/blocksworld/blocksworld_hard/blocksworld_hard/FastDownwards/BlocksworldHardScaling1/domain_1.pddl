(define (domain Blocksworld)
    (:requirements :strips :typing :negative-preconditions)
    (:types block)
    (:predicates
        (on ?x - block ?y - block)
        (ontable ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (handempty)
    )

    ;; Action: Pick up a block from the table
    (:action pick-up
        :parameters (?x - block)
        :precondition (and 
            (ontable ?x) 
            (clear ?x) 
            (handempty)
        )
        :effect (and 
            (not ontable ?x) 
            (not clear ?x) ; Block is no longer clear when held (based on specification)
            (not handempty) 
            (holding ?x)
        )
    )

    ;; Action: Put down a block onto the table
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and 
            (ontable ?x) 
            (clear ?x) ; Block is now on table and not held, thus clear
            (handempty) 
            (not holding ?x)
        )
    )

    ;; Action: Unstack a block from another block
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (on ?x ?y) 
            (clear ?x) 
            (handempty)
        )
        :effect (and 
            (not on ?x ?y) 
            (clear ?y)     ; Block below becomes clear
            (not clear ?x) ; Block being held is not clear
            (not handempty) 
            (holding ?x)
        )
    )

    ;; Action: Stack a block onto another block
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (holding ?x) 
            (clear ?y)
        )
        :effect (and 
            (on ?x ?y) 
            (not clear ?y) ; The block stacked onto is no longer clear
            (clear ?x)    ; The stacked block is now on top and not held, thus clear
            (handempty) 
            (not holding ?x)
        )
    )
)