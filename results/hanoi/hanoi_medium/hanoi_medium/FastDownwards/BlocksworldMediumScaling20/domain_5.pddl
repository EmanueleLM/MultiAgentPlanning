(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions)
    (:types block)
    (:predicates
        (on ?x - block ?y - block)
        (ontable ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (arm-empty)
    )

    ;; Pick up a block from the table
    (:action pick-up
        :parameters (?x - block)
        :precondition (and (clear ?x) (ontable ?x) (arm-empty))
        :effect (and (not (ontable ?x)) (not (clear ?x)) (not (arm-empty)) (holding ?x))
    )

    ;; Put down a block onto the table
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and (not (holding ?x)) (ontable ?x) (clear ?x) (arm-empty))
    )

    ;; Stack block ?x onto block ?y
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and (holding ?x) (clear ?y))
        :effect (and (not (holding ?x)) (not (clear ?y)) (clear ?x) (arm-empty) (on ?x ?y))
    )

    ;; Unstack block ?x from block ?y
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and (on ?x ?y) (clear ?x) (arm-empty))
        :effect (and (holding ?x) (clear ?y) (not (on ?x ?y)) (not (clear ?x)) (not (arm-empty)))
    )
)