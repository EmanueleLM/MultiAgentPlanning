(define (problem mystery_blocksworld27_problem)
    (:domain mystery_blocksworld27)
    (:objects
        a b c d - object
    )
    (:init
        (craves a d)
        (craves c b)
        (harmony)
        (planet b)
        (planet d)
        (province a)
        (province c)
    )
    (:goal (and
        (craves b a)
        (craves c b)
        (craves d c)
    ))
)