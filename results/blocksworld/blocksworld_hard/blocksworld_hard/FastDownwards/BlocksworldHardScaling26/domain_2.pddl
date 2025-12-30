(define (domain blocksworld)
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

    ;; Pick up block X from the table. X must be clear and hand must be empty.
    (:action pick-up
        :parameters (?x - block)
        :precondition (and (clear ?x) (ontable ?x) (handempty))
        :effect (and (not (ontable ?x))
                     (not (handempty))
                     (holding ?x)
                     (not (clear ?x)) ; Block is now held (picked up), thus not clear.
                     (increase (total-cost) 1)
                )
    )

    ;; Put down block X onto the table.
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and (ontable ?x)
                     (clear ?x) ; Block is now placed and nothing is on it, thus clear.
                     (handempty)
                     (not (holding ?x))
                     (increase (total-cost) 1)
                )
    )

    ;; Unstack block X from block Y. X must be clear and hand must be empty.
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and (on ?x ?y) (clear ?x) (handempty) (not (= ?x ?y)))
        :effect (and (holding ?x)
                     (clear ?y)
                     (not (on ?x ?y))
                     (not (handempty))
                     (not (clear ?x)) ; Block is now held (picked up), thus not clear.
                     (increase (total-cost) 1)
                )
    )

    ;; Stack block X onto block Y. X must be held, Y must be clear.
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and (holding ?x) (clear ?y) (not (= ?x ?y)))
        :effect (and (on ?x ?y)
                     (clear ?x) ; Block X is placed, thus clear.
                     (handempty)
                     (not (holding ?x))
                     (not (clear ?y)) ; Y is no longer clear.
                     (increase (total-cost) 1)
                )
    )
)