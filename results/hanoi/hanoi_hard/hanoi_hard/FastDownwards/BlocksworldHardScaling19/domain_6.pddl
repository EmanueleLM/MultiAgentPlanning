(define (domain blocksworld)
    (:requirements :strips :typing :negative-preconditions)
    (:types block)
    (:predicates
        (on ?x - block ?y - block)
        (ontable ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (handempty)
    )

    ;; Action 1: Pick up X from the table
    (:action pick-up
        :parameters (?x - block)
        :precondition (and (ontable ?x)
                           (clear ?x)
                           (handempty))
        :effect (and (not (ontable ?x))
                     (not (clear ?x))
                     (holding ?x)
                     (not (handempty))
        )
    )

    ;; Action 2: Put down X onto the table
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and (ontable ?x)
                     (clear ?x)
                     (handempty)
                     (not (holding ?x))
        )
    )

    ;; Action 3: Stack X onto Y
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and (holding ?x)
                           (clear ?y)
                           (not (= ?x ?y)))
        :effect (and (on ?x ?y)
                     (not (clear ?y))
                     (clear ?x)
                     (handempty)
                     (not (holding ?x))
        )
    )

    ;; Action 4: Unstack X from Y
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and (on ?x ?y)
                           (clear ?x)
                           (handempty)
                           (not (= ?x ?y)))
        :effect (and (holding ?x)
                     (clear ?y)
                     (not (on ?x ?y))
                     (not (handempty))
                     (not (clear ?x))
        )
    )
)