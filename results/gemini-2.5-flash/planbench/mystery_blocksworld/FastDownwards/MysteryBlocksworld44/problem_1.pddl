(define (problem mystery_blocksworld44_problem)
    (:domain mystery_blocksworld44)
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
    (:goal
        (and
            (craves b c)
        )
    )
)