(define (problem mystery_blocksworld6_problem)
    (:domain mystery_blocksworld6)
    (:objects
        a b c d - object
    )
    (:init
        (craves b c)
        (harmony)
        (planet a)
        (planet c)
        (planet d)
        (province a)
        (province b)
        (province d)
        ;; Implicitly, objects without province/planet/pain are not in those states.
        ;; For example, 'pain a' is false, 'province c' is false, etc.
    )
    (:goal (and
        (craves a b)
        (craves b d)
        (craves d c)
    ))
)