(define (domain blocks)
    (:requirements :strips :typing :negative-preconditions)
    (:types block)
    
    (:predicates
        (on ?x - block ?y - block)
        (ontable ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (handempty)
    )

    ;; Pick up a block from the table
    (:action pick-up
        :parameters (?b - block)
        :precondition (and
            (ontable ?b)
            (clear ?b)
            (handempty)
        )
        :effect (and
            (holding ?b)
            (not (ontable ?b))
            (not (clear ?b)) ; Block is no longer clear because it is picked up
            (not (handempty))
        )
    )

    ;; Put down a block onto the table
    (:action put-down
        :parameters (?b - block)
        :precondition (holding ?b)
        :effect (and
            (ontable ?b)
            (clear ?b) ; Block is now clear as nothing is on it and it is not held
            (handempty)
            (not (holding ?b))
        )
    )
    
    ;; Unstack block ?b1 from ?b2
    (:action unstack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and
            (on ?b1 ?b2)
            (clear ?b1)
            (handempty)
        )
        :effect (and
            (holding ?b1)
            (clear ?b2) ; The block underneath becomes clear
            (not (on ?b1 ?b2))
            (not (clear ?b1)) ; Block is no longer clear because it is picked up
            (not (handempty))
        )
    )
    
    ;; Stack block ?b1 (held) onto ?b2 (clear)
    (:action stack
        :parameters (?b1 - block ?b2 - block)
        :precondition (and
            (holding ?b1)
            (clear ?b2)
        )
        :effect (and
            (on ?b1 ?b2)
            (clear ?b1) ; b1 is now the top block and not held
            (handempty)
            (not (holding ?b1))
            (not (clear ?b2)) ; b2 is no longer clear
        )
    )
)