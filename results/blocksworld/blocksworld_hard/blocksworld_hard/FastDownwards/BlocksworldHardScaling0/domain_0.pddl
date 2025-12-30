(define (domain blocks-world)
    (:requirements :strips :typing)
    
    (:types
        block - object
    )
    
    (:predicates
        (on ?x - block ?y - block)  ; X is resting directly on Y
        (ontable ?x - block)        ; X is resting directly on the table
        (clear ?x - block)          ; Nothing is resting on X
        (holding ?x - block)        ; The hand is holding X
        (handempty)                 ; The hand is not holding any block
    )

    ;; 1. Pick up a block X from the table
    (:action pick-up
        :parameters (?x - block)
        :precondition (and 
            (ontable ?x)
            (clear ?x) 
            (handempty)
        )
        :effect (and 
            (not (ontable ?x))
            (not (clear ?x))
            (not (handempty))
            (holding ?x)
        )
    )

    ;; 2. Put down a held block X onto the table
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and 
            (ontable ?x)
            (clear ?x) 
            (handempty)
            (not (holding ?x))
        )
    )

    ;; 3. Unstack block X from block Y 
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (on ?x ?y)
            (clear ?x)
            (handempty)
        )
        :effect (and 
            (not (on ?x ?y))
            (not (clear ?x)) 
            (clear ?y)
            (holding ?x)
            (not (handempty))
        )
    )

    ;; 4. Stack block X (held) onto block Y
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (holding ?x)
            (clear ?y)
        )
        :effect (and 
            (on ?x ?y)
            (clear ?x) 
            (not (clear ?y))
            (handempty)
            (not (holding ?x))
        )
    )
)