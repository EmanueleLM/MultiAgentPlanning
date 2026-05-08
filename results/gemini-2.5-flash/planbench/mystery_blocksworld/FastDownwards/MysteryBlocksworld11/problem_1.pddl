(define (problem mystery_blocksworld_11)
    (:domain mystery_blocksworld)
    (:objects
        a b c d - object
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
    (:goal (object_craves a b))
)