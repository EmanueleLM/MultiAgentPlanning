(define (domain blocksworld-medium-scaling5)
    (:requirements :strips :typing :negative-preconditions)
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

    ;; Action: Pick up a block from the table
    (:action pick-up
        :parameters (?x - block)
        :precondition (and
            (clear ?x)
            (ontable ?x)
            (handempty)
        )
        :effect (and
            (not (ontable ?x))
            (not (clear ?x))
            (not (handempty))
            (holding ?x)
        )
    )

    ;; Action: Unstack a block from another block
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and
            (on ?x ?y)
            (clear ?x) ; block being unstacked must be clear
            (handempty)
        )
        :effect (and
            (not (on ?x ?y))
            (clear ?y) ; block y becomes clear
            (not (clear ?x))
            (not (handempty))
            (holding ?x)
        )
    )

    ;; Action: Put down a block onto the table
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and
            (not (holding ?x))
            (handempty)
            (ontable ?x)
            (clear ?x)
        )
    )

    ;; Action: Stack a block onto another block
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and
            (holding ?x)
            (clear ?y) ; target block must be clear
        )
        :effect (and
            (not (holding ?x))
            (not (clear ?y)) ; target block is no longer clear
            (handempty)
            (on ?x ?y)
            (clear ?x) ; stacked block becomes clear
        )
    )
)