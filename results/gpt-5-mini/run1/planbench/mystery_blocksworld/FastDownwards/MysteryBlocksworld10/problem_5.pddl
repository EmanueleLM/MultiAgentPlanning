(define (problem mystery_blocksworld10)
  (:domain mystery_blocksworld)
  (:objects
    a b c d
  )

  (:init
    ;; global harmony
    (harmony)

    ;; initial provinces
    (province a)
    (province b)
    (province c)

    ;; initial planets
    (planet a)
    (planet c)
    (planet d)

    ;; initial craving
    (craves b d)
  )

  (:goal (and
    (craves b c)
    (craves d a)
  ))
)