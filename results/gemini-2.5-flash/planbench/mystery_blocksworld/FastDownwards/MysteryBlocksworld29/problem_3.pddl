(define (problem mystery_blocksworld29_problem)
    (:domain mystery_blocksworld29)
    (:objects
        a b c d - object
    )
    (:init
        (craves a c)
        (craves b d)
        (harmony)
        (planet c)
        (planet d)
        (province a)
        (province b)
    )
    (:goal (and
        (craves a c)
        (craves b a)
    ))
)