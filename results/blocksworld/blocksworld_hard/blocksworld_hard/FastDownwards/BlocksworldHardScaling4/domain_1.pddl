(define (domain blocksworld-hard-scaling4)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types block)
    (:predicates
        (on ?x - block ?y - block)
        (ontable ?x - block)
        (clear ?x - block)
        (handempty)
        (holding ?x - block)
    )

    (:functions
        (total-cost)
    )

    ;; Action: pick-up (from table)
    (:action pick-up
        :parameters (?x - block)
        :precondition (and (clear ?x) (ontable ?x) (handempty))
        :effect (and (not (ontable ?x)) (not (clear ?x)) (not (handempty))
                     (holding ?x)
                     (increase (total-cost) 1))
    )

    ;; Action: put-down (onto table)
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and (not (holding ?x)) (ontable ?x) (clear ?x) (handempty)
                     (increase (total-cost) 1))
    )

    ;; Action: stack (?x on ?y)
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and (holding ?x) (clear ?y))
        :effect (and (not (holding ?x)) (not (clear ?y))
                     (on ?x ?y) (clear ?x) (handempty)
                     (increase (total-cost) 1))
    )

    ;; Action: unstack (?x from ?y)
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and (on ?x ?y) (clear ?x) (handempty))
        :effect (and (not (on ?x ?y)) (not (clear ?x)) (not (handempty))
                     (clear ?y) (holding ?x)
                     (increase (total-cost) 1))
    )
)