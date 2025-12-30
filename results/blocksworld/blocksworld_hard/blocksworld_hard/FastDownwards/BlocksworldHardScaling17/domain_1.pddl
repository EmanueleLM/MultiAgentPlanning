(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        block
    )
    (:predicates
        (on ?x - block ?y - block)
        (ontable ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (handempty)
    )

    ;; Action 1: Pick up a block from the table
    (:action pick-up
        :parameters (?x - block)
        :precondition (and (clear ?x) (ontable ?x) (handempty))
        :effect (and (not (ontable ?x)) (not (clear ?x)) (not (handempty)) (holding ?x))
    )

    ;; Action 2: Put down a block onto the table
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and (not (holding ?x)) (handempty) (ontable ?x) (clear ?x))
    )

    ;; Action 3: Unstack a block from another block
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and (on ?x ?y) (clear ?x) (handempty))
        :effect (and (not (on ?x ?y)) (not (clear ?x)) (clear ?y) (not (handempty)) (holding ?x))
    )

    ;; Action 4: Stack a block onto another block
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and (holding ?x) (clear ?y))
        :effect (and (not (holding ?x)) (on ?x ?y) (not (clear ?y)) (clear ?x) (handempty))
    )
)