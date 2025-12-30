(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions)
    (:types block)
    (:predicates
        (on ?x - block ?y - block)
        (ontable ?x - block)
        (clear ?x - block)
        (handempty)
        (holding ?x - block)
    )

    (:action pick-up
        :parameters (?x - block)
        :precondition (and 
            (clear ?x) 
            (ontable ?x) 
            (handempty)
        )
        :effect (and 
            (not (ontable ?x)) 
            (not (handempty))
            (holding ?x)
        )
    )
    
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (on ?x ?y) 
            (clear ?x) 
            (handempty)
        )
        :effect (and 
            (not (on ?x ?y)) 
            (not (handempty)) 
            (clear ?y)
            (holding ?x)
        )
    )
    
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and 
            (not (holding ?x)) 
            (ontable ?x) 
            (clear ?x) 
            (handempty)
        )
    )
    
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and 
            (holding ?x) 
            (clear ?y)
        )
        :effect (and 
            (not (holding ?x)) 
            (not (clear ?y)) 
            (on ?x ?y) 
            (clear ?x) 
            (handempty)
        )
    )
)