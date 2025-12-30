(define (problem MysteryBlocksworld16_P1)
    (:domain MysteryBlocksworld16)
    
    (:objects
        a b c d - entity
    )
    
    (:init
        (craves a c)
        (craves b a)
        (craves d b)
        (harmony)
        (planet c)
        (province d)
    )
    
    (:goal (and
        (craves b c)
        (craves c d)
    ))
)