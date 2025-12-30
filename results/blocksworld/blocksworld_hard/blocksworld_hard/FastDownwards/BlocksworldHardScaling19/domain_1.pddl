(define (domain blocksworld-hard-scaling)
    (:requirements :strips :typing :negative-preconditions)
    (:types block)
    (:predicates
        (on ?x - block ?y - block)
        (ontable ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (handempty)
    )

    ;; Pick up a block X from the table
    (:action pick-up
        :parameters (?x - block)
        :precondition (and 
            (ontable ?x)
            (clear ?x) 
            (handempty)
        )
        :effect (and
            (not (ontable ?x))
            (not (handempty))
            (holding ?x)
            (not (clear ?x)) ; If held, X is not clear according to specification.
        )
    )

    ;; Put down a block X onto the table
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and
            (ontable ?x)
            (handempty)
            (not (holding ?x))
            (clear ?x) ; Now on table, not held, nothing on it.
        )
    )

    ;; Unstack a block X from block Y
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and
            (on ?x ?y)
            (clear ?x)
            (handempty)
        )
        :effect (and
            (not (on ?x ?y))
            (clear ?y)
            (not (handempty))
            (holding ?x)
            (not (clear ?x)) ; If held, X is not clear.
        )
    )

    ;; Stack a block X onto block Y
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and
            (holding ?x)
            (clear ?y)
        )
        :effect (and
            (on ?x ?y)
            (not (holding ?x))
            (handempty)
            (not (clear ?y)) ; Y is no longer clear
            (clear ?x)      ; X is placed, no longer held, nothing on it.
        )
    )
)