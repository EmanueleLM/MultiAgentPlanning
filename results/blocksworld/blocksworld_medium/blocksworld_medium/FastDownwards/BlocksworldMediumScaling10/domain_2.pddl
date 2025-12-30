(define (domain blocks)
    (:requirements :strips :typing :negative-preconditions)
    (:types block)
    
    (:predicates 
        (ontable ?x - block)
        (clear ?x - block)
        (on ?x - block ?y - block)
        (holding ?x - block)
        (handempty)
    )

    ;; Action 1: Pick up a block from the table
    (:action pick-up
        :parameters (?x - block)
        :precondition (and 
            (clear ?x) 
            (ontable ?x) 
            (handempty)
        )
        :effect (and 
            (not (ontable ?x)) 
            (not (clear ?x)) ; No longer clear because it is being held (picked up)
            (not (handempty)) 
            (holding ?x)
        )
    )

    ;; Action 2: Unstack a block from another block
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (on ?x ?y) 
            (clear ?x) 
            (handempty)
        )
        :effect (and 
            (not (on ?x ?y)) 
            (not (clear ?x)) ; No longer clear because it is being held
            (clear ?y)       ; The block underneath becomes clear
            (not (handempty)) 
            (holding ?x)
        )
    )

    ;; Action 3: Put down a block onto the table
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and 
            (ontable ?x) 
            (clear ?x)       ; Block is now clear (not picked up, nothing on it)
            (not (holding ?x)) 
            (handempty)
        )
    )

    ;; Action 4: Stack a block onto another block
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (holding ?x) 
            (clear ?y)
        )
        :effect (and 
            (on ?x ?y) 
            (not (clear ?y)) ; The block underneath is no longer clear
            (clear ?x)       ; The stacked block is now the topmost block
            (not (holding ?x)) 
            (handempty)
        )
    )
)