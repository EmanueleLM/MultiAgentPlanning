(define (problem mystery_blocksworld32_problem)
    (:domain mystery_blocksworld32)
    (:objects
        a b c d - object
    )
    (:init
        (craves a c)
        (craves b a)
        (harmony)
        (planet c)
        (planet d)
        (province b)
        (province d)
    )
    (:goal (and (craves a c)
                (craves d b)))
)