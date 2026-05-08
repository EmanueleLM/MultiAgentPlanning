(define (problem mystery_blocksworld8_problem)
    (:domain mystery_blocksworld8)
    (:objects
        a b c d - item
    )
    (:init
        (object_craves c b)
        (object_craves d a)
        (harmony)
        (planet a)
        (planet b)
        (province c)
        (province d)
    )
    (:goal (and
        (object_craves a d)
        (object_craves b c)
    ))
)