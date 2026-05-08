(define (problem mystery-14)
    (:domain mysteryblocksworld)
    (:objects
        a b c d - object
    )
    (:init
        (craves d c)
        (harmony)
        (planet a)
        (planet b)
        (planet c)
        (province a)
        (province b)
        (province d)
    )
    (:goal (and
        (craves c b)
        (craves d a)
    ))
)