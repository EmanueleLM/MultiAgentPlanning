(define (problem mystery_blocksworld20_p)
    (:domain mystery_blocksworld20)
    (:objects
        a b c d - object
    )
    (:init
        (object_craves c a)
        (object_craves d c)
        (harmony)
        (planet a)
        (planet b)
        (province b)
        (province d)
    )
    (:goal (and
        (object_craves b c)
        (object_craves d a)
    ))
)