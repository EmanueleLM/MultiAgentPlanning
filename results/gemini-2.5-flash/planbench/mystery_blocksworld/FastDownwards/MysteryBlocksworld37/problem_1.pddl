(define (problem mystery_blocksworld_instance)
    (:domain mystery_blocksworld)
    (:objects
        a b c d - object
    )
    (:init
        (craves c b)
        (craves d c)
        (harmony)
        (planet a)
        (planet b)
        (province a)
        (province d)
        (= (total-cost) 0)
    )
    (:goal (and
        (craves a b)
        (craves c d)
        (craves d a)
    ))
    (:metric minimize (total-cost))
)