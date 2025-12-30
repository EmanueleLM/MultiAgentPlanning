(define (domain blocksworld-hard-scaling)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types block)

    (:predicates
        (on ?x - block ?y - block)
        (ontable ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (handempty)
    )

    (:functions
        (total-cost) - number
    )

    ;; Action 1: Pick up a block from the table
    (:action pick-up
        :parameters (?x - block)
        :precondition (and (clear ?x) (ontable ?x) (handempty))
        :effect (and (not (ontable ?x))
                     (not (clear ?x))
                     (not (handempty))
                     (holding ?x)
                     (increase (total-cost) 1)
               )
    )

    ;; Action 2: Put down a block onto the table
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and (not (holding ?x))
                     (handempty)
                     (ontable ?x)
                     (clear ?x)
                     (increase (total-cost) 1)
               )
    )

    ;; Action 3: Stack block x onto block y
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and (holding ?x) (clear ?y))
        :effect (and (not (holding ?x))
                     (not (clear ?y))
                     (clear ?x)
                     (handempty)
                     (on ?x ?y)
                     (increase (total-cost) 1)
               )
    )

    ;; Action 4: Unstack block x from block y
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and (on ?x ?y) (clear ?x) (handempty))
        :effect (and (holding ?x)
                     (clear ?y)
                     (not (clear ?x))
                     (not (on ?x ?y))
                     (not (handempty))
                     (increase (total-cost) 1)
               )
    )
)