(define (problem mystery_blocksworld28_p1)
    (:domain mystery_blocksworld28)
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
        (craves d c)
    ))
)