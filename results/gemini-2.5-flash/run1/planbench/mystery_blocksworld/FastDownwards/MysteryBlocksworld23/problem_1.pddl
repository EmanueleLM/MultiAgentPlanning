(define (problem mystery_blocksworld23_problem)
    (:domain mystery_blocksworld23)
    (:objects
        a b c d - object
    )
    (:init
        (craves b a)
        (craves d b)
        (harmony)
        (planet a)
        (planet c)
        (province c)
        (province d)
    )
    (:goal (and
        (craves b d)
    ))
)