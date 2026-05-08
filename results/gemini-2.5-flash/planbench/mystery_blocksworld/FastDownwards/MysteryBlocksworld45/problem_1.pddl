(define (problem mystery_blocksworld45_problem)
    (:domain mystery_blocksworld45)
    (:objects
        a b c d - object
    )
    (:init
        (craves a d)
        (craves c a)
        (harmony)
        (planet b)
        (planet d)
        (province b)
        (province c)
    )
    (:goal (and
        (craves a d)
        (craves b a)
        (craves d c)
    ))
)