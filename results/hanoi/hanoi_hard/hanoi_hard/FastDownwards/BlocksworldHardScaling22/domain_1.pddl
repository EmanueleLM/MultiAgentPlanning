(define (domain blocksworld)
    (:requirements :strips :typing)
    (:types block)
    (:predicates
        (on ?x - block ?y - block)
        (on-table ?x - block)
        (clear ?x - block)
        (holding ?x - block)
        (hand-empty)
    )

    ;; PICK UP X from TABLE
    (define (action pick-up)
        :parameters (?x - block)
        :precondition (and
            (clear ?x)
            (on-table ?x)
            (hand-empty)
        )
        :effect (and
            (holding ?x)
            (not (clear ?x))
            (not (on-table ?x))
            (not (hand-empty))
        )
    )

    ;; PUT DOWN X onto TABLE
    (define (action put-down)
        :parameters (?x - block)
        :precondition (holding ?x)
        :effect (and
            (on-table ?x)
            (clear ?x)
            (hand-empty)
            (not (holding ?x))
        )
    )

    ;; UNSTACK X from Y
    (define (action unstack)
        :parameters (?x - block ?y - block)
        :precondition (and
            (on ?x ?y)
            (clear ?x)
            (hand-empty)
        )
        :effect (and
            (holding ?x)
            (clear ?y)
            (not (clear ?x))
            (not (on ?x ?y))
            (not (hand-empty))
        )
    )

    ;; STACK X onto Y
    (define (action stack)
        :parameters (?x - block ?y - block)
        :precondition (and
            (holding ?x)
            (clear ?y)
        )
        :effect (and
            (on ?x ?y)
            (hand-empty)
            (clear ?x)
            (not (holding ?x))
            (not (clear ?y))
        )
    )
)