(define (problem mystery_blocksworld7_problem)
    (:domain mystery_blocksworld7)
    (:objects
        a - object
        b - object
        c - object
        d - object
    )
    (:init
        (craves c d)
        (craves d a)
        (harmony)
        (planet a)
        (planet b)
        (province b)
        (province c)
    )
    (:goal (and
        (craves a c)
        (craves b a)
        (craves d b)
    ))
)