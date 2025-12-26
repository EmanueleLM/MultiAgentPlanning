(define (problem P1)
    (:domain MysteryBlocksworld1)
    (:objects
        a b c d - object
    )
    (:init
        (Craves b c)
        (Craves c d)
        (Craves d a)
        (Harmony)
        (Planet a)
        (Province b)
    )
    (:goal (and
        (Craves a c)
        (Craves d a)
    ))
)