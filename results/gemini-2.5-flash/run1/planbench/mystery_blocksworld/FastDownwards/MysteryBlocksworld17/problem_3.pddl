(define (problem mystery-blocksworld-17-problem)
    (:domain mystery-blocksworld-17)
    (:objects
        a b c d - object
    )
    (:init
        (craves a d)
        (craves c a)
        (harmony)
        (planet b)
        (planet d)
        (province b)
        (province c)
    )
    (:goal (and
        (craves a b)
        (craves c a)
        (craves d c)
    ))