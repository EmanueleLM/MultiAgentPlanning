(define (problem mystery_blocksworld15_problem)
    (:domain mystery_blocksworld15)
    (:objects
        a b c d - object
    )
    (:init
        (craves a d)
        (craves d c)
        (harmony)
        (planet b)
        (planet c)
        (province a)
        (province b)
    )
    (:goal (and
        (craves b c)
        (craves c d)
    ))
)