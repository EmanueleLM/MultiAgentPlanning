(define (domain BlocksworldHardScaling28)
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

    ;; 1. Pick up block x from the table
    (:action pick-up
        :parameters (?x - block)
        :precondition (and (clear ?x) (ontable ?x) (handempty))
        :effect (and (holding ?x)
                     (not (ontable ?x))
                     (not (clear ?x))
                     (not (handempty))
        )
    )

    ;; 2. Put down block x onto the table
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and (ontable ?x)
                     (clear ?x)
                     (handempty)
                     (not (holding ?x))
        )
    )

    ;; 3. Unstack block x from block y
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and (on ?x ?y) (clear ?x) (handempty))
        :effect (and (holding ?x)
                     (clear ?y)
                     (not (on ?x ?y))
                     (not (clear ?x))
                     (not (handempty))
        )
    )

    ;; 4. Stack block x onto block y
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and (holding ?x) (clear ?y))
        :effect (and (on ?x ?y)
                     (clear ?x)
                     (handempty)
                     (not (holding ?x))
                     (not (clear ?y))
        )
    )
)