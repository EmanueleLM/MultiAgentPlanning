(define (domain blocksworld)
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
            (not (ontable ?x)) 
            (not (clear ?x))  ; Not clear because it is now picked up/held
            (not (handempty)) 
            (holding ?x)
        )
    )

    ;; Action: Put down a block onto the table
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and 
            (ontable ?x) 
            (clear ?x)        ; Now clear (nothing on it, and not held)
            (handempty) 
            (not (holding ?x))
        )
    )

    ;; Action: Unstack a block from another block
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (on ?x ?y) 
            (clear ?x)        ; Must be clear (nothing on it, and not held)
            (handempty)
        )
        :effect (and 
            (not (on ?x ?y)) 
            (clear ?y)        ; Block below is now clear
            (not (clear ?x))  ; Not clear because it is now picked up/held
            (not (handempty)) 
            (holding ?x)
        )
    )

    ;; Action: Stack a block onto another block
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (holding ?x) 
            (clear ?y)        ; Block receiving stack must be clear (and not held)
        )
        :effect (and 
            (on ?x ?y) 
            (not (clear ?y))  ; Block below is no longer clear
            (clear ?x)        ; Block stacked on top is now clear (and not held)
            (handempty) 
            (not (holding ?x))
        )
    )
)