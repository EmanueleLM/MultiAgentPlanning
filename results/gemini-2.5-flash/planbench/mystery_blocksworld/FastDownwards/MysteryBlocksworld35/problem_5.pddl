(define (problem mystery-blocksworld35-instance)
    (:domain mystery-blocksworld35)
    (:objects
        a b c d - object
    )
    (:init
        (craves b d)
        (craves d a)
        (harmony)
        (planet a)
        (planet c)
        (province b)
        (province c)
    )
    (:goal (and
        (craves b a)
        (craves c d)
    ))
)