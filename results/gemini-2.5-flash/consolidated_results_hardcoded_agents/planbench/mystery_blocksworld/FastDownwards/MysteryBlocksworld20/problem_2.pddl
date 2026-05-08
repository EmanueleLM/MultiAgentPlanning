(define (problem MysteryBlocksworld20_Problem)
    (:domain MysteryBlocksworld20)
    (:objects
        a b c d - object
    )
    (:init
        (= (total-cost) 0)
        (ObjectCraves c a)
        (ObjectCraves d c)
        (Harmony)
        (Planet a)
        (Planet b)
        (Province b)
        (Province d)
    )
    (:goal (and
        (ObjectCraves b c)
        (ObjectCraves d a)
    ))
    (:metric minimize (total-cost))
)