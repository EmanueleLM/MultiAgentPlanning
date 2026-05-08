(define (problem MysteryBlocksworld31)
    (:domain mystery_blocksworld)
    (:objects
        a b c d - object
    )
    (:init
        (craves a c)
        (craves b a)
        (harmony)
        (planet c)
        (planet d)
        (province b)
        (province d)
    )
    (:goal (and
        (craves a b)
        (craves b d)
        (craves d c)
    ))
)