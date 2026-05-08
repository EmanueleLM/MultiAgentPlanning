(define (problem MysteryBlocksworld0_Instance)
    (:domain MysteryBlocksworld0)
    (:objects
        a b c d - object
    )
    (:init
        (Craves a b)
        (Craves d c)
        (Harmony)
        (Planet b)
        (Planet c)
        (Province a)
        (Province d)
    )
    (:goal (Craves c a))
)