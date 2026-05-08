(define (problem mystery_blocksworld18_problem)
    (:domain mystery_blocksworld18)
    (:objects
        a b c d - object
    )
    (:init
        (craves b d)
        (craves c a)
        (harmony)
        (planet a)
        (planet d)
        (province b)
        (province c)
    )
    (:goal (and
        (craves b a)
        (craves c d)
        (craves d b)
    ))
)