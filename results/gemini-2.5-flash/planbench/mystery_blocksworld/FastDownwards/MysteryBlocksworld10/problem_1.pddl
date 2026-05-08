(define (problem mysteryblocksworld-problem)
    (:domain mysteryblocksworld)
    (:objects
        a b c d - object
    )
    (:init
        (objectcraves b d)
        (harmony)
        (planet a)
        (planet c)
        (planet d)
        (province a)
        (province b)
        (province c)
    )
    (:goal (and
        (objectcraves b c)
        (objectcraves d a)
    ))
)