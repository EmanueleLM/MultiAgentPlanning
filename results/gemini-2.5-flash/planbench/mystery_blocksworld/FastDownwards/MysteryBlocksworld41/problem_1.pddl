(define (problem mystery_blocksworld41_p01)
    (:domain mystery_blocksworld41)
    (:objects
        a b c d - object
    )
    (:init
        (craves a b)
        (craves d a)
        (harmony)
        (planet b)
        (planet c)
        (province c)
        (province d)
    )
    (:goal (and
        (craves a c)
        (craves c b)
    ))
)