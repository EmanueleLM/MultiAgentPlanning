(define (domain blocksworld-hard-scaling)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        block
    )
    
    (:predicates
        (on ?x - block ?y - block)
        (ontable ?x - block)
        (clear ?x - block)
        (handempty)
        (holding ?x - block)
    )

    (:functions (total-cost) - number)

    ;; Action 1: PICK UP (from table)
    (:action pick-up
        :parameters (?x - block)
        :precondition (and (clear ?x) (ontable ?x) (handempty))
        :effect (and (not (ontable ?x)) (not (clear ?x)) (not (handempty)) 
                     (holding ?x) (increase (total-cost) 1))
    )

    ;; Action 2: PUT DOWN (onto table)
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and (not (holding ?x)) (clear ?x) (ontable ?x) (handempty) 
                     (increase (total-cost) 1))
    )

    ;; Action 3: STACK (X onto Y)
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and (holding ?x) (clear ?y))
        :effect (and (not (holding ?x)) (not (clear ?y)) (clear ?x) 
                     (handempty) (on ?x ?y) (increase (total-cost) 1))
    )

    ;; Action 4: UNSTACK (X from Y)
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and (on ?x ?y) (clear ?x) (handempty))
        :effect (and (not (on ?x ?y)) (not (clear ?x)) (not (handempty)) 
                     (clear ?y) (holding ?x) (increase (total-cost) 1))
    )
)