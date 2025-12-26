(define (problem MysteryBlocksworld3_P1)
    (:domain MysteryBlocksworld3)
    (:objects
        a b c d - object
    )
    (:init
        (ObjectCraves b a)
        (ObjectCraves c b)
        (Harmony)
        (Planet a)
        (Planet d)
        (Province c)
        (Province d)
        (= (total-cost) 0)
    )
    (:goal (and
        (ObjectCraves b a)
        (ObjectCraves d c)
    ))
    (:metric minimize (total-cost))
)