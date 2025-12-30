(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions)
    (:types block)
    (:predicates
        (ontable ?x - block)
        (clear ?x - block)
        (on ?x - block ?y - block)
        (holding ?x - block)
        (handempty)
    )

    ;; Pick up a block ?x from the table
    (:action pick-up
        :parameters (?x - block)
        :precondition (and (handempty)
                           (ontable ?x)
                           (clear ?x))
        :effect (and (not (ontable ?x))
                     (not (clear ?x))
                     (not (handempty))
                     (holding ?x))
    )

    ;; Unstack a block ?x from ?y
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and (handempty)
                           (on ?x ?y)
                           (clear ?x))
        :effect (and (holding ?x)
                     (clear ?y)
                     (not (clear ?x))
                     (not (handempty))
                     (not (on ?x ?y)))
    )

    ;; Put down a block ?x onto the table
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and (ontable ?x)
                     (clear ?x)
                     (handempty)
                     (not (holding ?x)))
    )

    ;; Stack a block ?x on top of block ?y
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and (holding ?x)
                           (clear ?y))
        :effect (and (on ?x ?y)
                     (clear ?x)
                     (not (clear ?y))
                     (handempty)
                     (not (holding ?x)))
    )
)