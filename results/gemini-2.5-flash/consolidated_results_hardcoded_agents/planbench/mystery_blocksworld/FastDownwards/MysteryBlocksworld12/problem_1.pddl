(define (problem pb12_MysteryBlocksworld)
    (:domain MysteryBlocksworld12)
    (:objects
        a b c d - object
    )
    (:init
        (= (total-cost) 0)
        ;; Initial State: object a craves object b, object b craves object c, object c craves object d, harmony, planet object d and province object a.
        (Craves a b)
        (Craves b c)
        (Craves c d)
        (Harmony)
        (Planet d)
        (Province a)
    )
    (:goal (and
        ;; Goal State: object b craves object c, object c craves object d and object d craves object a.
        (Craves b c)
        (Craves c d)
        (Craves d a)
    ))
    (:metric minimize (total-cost))
)