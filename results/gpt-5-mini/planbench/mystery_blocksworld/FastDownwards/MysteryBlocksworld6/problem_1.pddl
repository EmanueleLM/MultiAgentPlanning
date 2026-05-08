(define (problem mystery_blocksworld6_problem)
  (:domain mystery_blocksworld6)

  (:objects
    a b c d - item
  )

  (:init
    ;; initial craves relation
    (craves b c)

    ;; harmony initially true
    (harmony)

    ;; initial planets
    (planet a)
    (planet c)
    (planet d)

    ;; initial provinces
    (province a)
    (province b)
    (province d)
  )

  (:goal (and
           (craves a b)
           (craves b d)
           (craves d c)
         ))
)