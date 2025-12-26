(define (problem pb1)
    (:domain MysteryBlocksworld18)
    (:objects
        a b c d - object
    )
    (:init
        (Craves b d)
        (Craves c a)
        (Harmony)
        (Planet a)
        (Planet d)
        (Province b)
        (Province c)
    )
    (:goal (and
        (Craves b a)
        (Craves c d)
        (Craves d b)
    ))
)