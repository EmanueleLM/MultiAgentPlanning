(define (problem mystery-blocksworld3-p1)
    (:domain mystery-blocksworld3)
    (:objects
        a b c d - object
    )
    (:init
        (object_craves b a)
        (object_craves c b)
        (harmony)
        (planet a)
        (planet d)
        (province c)
        (province d)
    )
    (:goal (and
        (object_craves b a)
        (object_craves d c)
    ))
)