(define (problem mystery_blocksworld26-problem)
  (:domain mystery_blocksworld26)
  (:objects
    a b c d - object
  )

  (:init
    ;; initial craves relations
    (craves a b)
    (craves b d)

    ;; global condition
    (harmony)

    ;; initial planets
    (planet c)
    (planet d)

    ;; initial provinces
    (province a)
    (province c)
  )

  (:goal (and
    (craves b d)
    (craves c a)
    (craves d c)
  ))
)