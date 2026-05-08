(define (problem mystery-blocksworld-6-P1)
    (:domain mystery-blocksworld-6)
    (:objects
        a b c d - object
    )
    (:init
        (craves b c)
        (harmony)
        (planet a)
        (planet c)
        (planet d)
        (province a)
        (province b)
        (province d)
    )
    (:goal (and
        (craves a b)
        (craves b d)
        (craves d c)
    ))
)