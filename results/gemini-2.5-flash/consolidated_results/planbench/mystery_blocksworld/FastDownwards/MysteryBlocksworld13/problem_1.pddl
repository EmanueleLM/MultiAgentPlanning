(define (problem mbw-13-1)
    (:domain MysteryBlocksworld13)
    (:objects
        a b c d - object
    )
    (:init
        (Craves b d)
        (Craves c b)
        (Harmony)
        (Planet a)
        (Planet d)
        (Province a)
        (Province c)
        (= (total-cost) 0)
    )
    (:goal (and
        (Craves a c)
        (Craves b a)
    ))
    (:metric minimize (total-cost))
)