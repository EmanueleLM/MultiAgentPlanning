(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions)
    (:types block object)
    
    (:predicates
        (on ?x - block ?y - block)
        (ontable ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (hand-empty)
    )

    ;; Action 1: pick-up (from table)
    (:action pick-up
        :parameters (?b - block)
        :precondition (and (clear ?b) (ontable ?b) (hand-empty))
        :effect (and 
            (holding ?b) 
            (not (clear ?b)) 
            (not (ontable ?b)) 
            (not (hand-empty))
        )
    )

    ;; Action 2: put-down (onto table)
    (:action put-down
        :parameters (?b - block)
        :precondition (holding ?b)
        :effect (and 
            (clear ?b) 
            (ontable ?b) 
            (hand-empty) 
            (not (holding ?b))
        )
    )

    ;; Action 3: unstack (from block c)
    (:action unstack
        :parameters (?b - block ?c - block)
        :precondition (and (on ?b ?c) (clear ?b) (hand-empty))
        :effect (and 
            (holding ?b) 
            (clear ?c) 
            (not (clear ?b)) 
            (not (on ?b ?c)) 
            (not (hand-empty))
        )
    )

    ;; Action 4: stack (onto block c)
    (:action stack
        :parameters (?b - block ?c - block)
        :precondition (and (holding ?b) (clear ?c))
        :effect (and 
            (on ?b ?c) 
            (clear ?b) 
            (not (holding ?b)) 
            (not (clear ?c)) 
            (hand-empty)
        )
    )
)