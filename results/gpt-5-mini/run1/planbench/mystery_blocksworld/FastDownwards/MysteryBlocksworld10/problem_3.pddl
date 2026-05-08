(define (problem mystery-blocksworld10)
  (:domain mystery-blocksworld)
  (:objects
    a b c d
  )

  (:init
    ;; global harmony
    (harmony)

    ;; initial provinces (from the specification)
    (province a)
    (province b)
    (province c)

    ;; initial planets (from the specification)
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