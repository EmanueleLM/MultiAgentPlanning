(define (domain BlocksworldMediumScaling2)
    (:requirements :strips :typing :negative-preconditions)
    (:types block)
    
    (:predicates
        (on ?x - block ?y - block)
        (ontable ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (handempty)
    )

    ; 1. Pick Up (Block X from table)
    ; R3: Requires X is on the table and X is clear. Effects: Hand holds X, X is no longer on table, hand is no longer empty.
    (:action pick-up
        :parameters (?x - block)
        :precondition (and
            (clear ?x)
            (ontable ?x)
            (handempty)
        )
        :effect (and
            (holding ?x)
            (not (ontable ?x))
            (not (handempty))
        )
    )

    ; 2. Unstack (Block X from Block Y)
    ; R4: Requires X is on Y and X is clear and hand is empty. Effects: Hand holds X, Y becomes clear, X is no longer on Y, hand is no longer empty.
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and
            (on ?x ?y)
            (clear ?x)
            (handempty)
        )
        :effect (and
            (holding ?x)
            (clear ?y)
            (not (on ?x ?y))
            (not (handempty))
        )
    )

    ; 3. Put Down (Block X onto table)
    ; R5: Requires hand holds X. Effects: Hand becomes empty, X is now on the table, X is clear.
    (:action put-down
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and
            (handempty)
            (ontable ?x)
            (clear ?x)
            (not (holding ?x))
        )
    )

    ; 4. Stack (Block X onto Block Y)
    ; R6: Requires hand holds X and Y is clear. Effects: Hand becomes empty, X is on Y, Y is no longer clear.
    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and
            (holding ?x)
            (clear ?y)
        )
        :effect (and
            (handempty)
            (on ?x ?y)
            (clear ?x) ; X is now on top
            (not (holding ?x))
            (not (clear ?y))
        )
    )
)