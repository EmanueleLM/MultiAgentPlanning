(define (problem mbw-15-p1)
    (:domain mysteryblocksworld15)
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