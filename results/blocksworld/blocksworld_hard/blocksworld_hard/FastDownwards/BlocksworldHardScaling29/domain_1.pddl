(define (domain BlocksworldHardScaling29)
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
    (:functions
        (total-cost) - number
    )

    ;; Action 1: pick-up (from table)
    (:action pick-up
        :parameters (?x - block)
        :precondition (and (clear ?x) (ontable ?x) (handempty))
        :effect (and (not (ontable ?x))
                     (not (handempty))
                     (holding ?x)
                     (increase (total-cost) 1)
               )
    )

    ;; Action 2: put-down (onto table)
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and (ontable ?x)
                     (clear ?x)
                     (handempty)
                     (not (holding ?x))
                     (increase (total-cost) 1)
               )
    )

    ;; Action 3: unstack (from block ?y)
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and (on ?x ?y) (clear ?x) (handempty))
        :effect (and (not (on ?x ?y))
                     (clear ?y)
                     (not (handempty))
                     (holding ?x)
                     (increase (total-cost) 1)
               )
    )

    ;; Action 4: stack (onto block ?y)
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and (holding ?x) (clear ?y))
        :effect (and (on ?x ?y)
                     (not (clear ?y))
                     (clear ?x)
                     (handempty)
                     (not (holding ?x))
                     (increase (total-cost) 1)
               )
    )
)