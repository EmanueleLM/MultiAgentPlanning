(define (problem MBW7-P1)
    (:domain MysteryBlocksworld7)
    (:objects
        a b c d - object
    )
    (:init
        (Craves c d)
        (Craves d a)
        (Harmony)
        (Planet a)
        (Planet b)
        (Province b)
        (Province c)
    )
    (:goal (and
        (Craves a c)
        (Craves b a)
        (Craves d b)
    ))
)