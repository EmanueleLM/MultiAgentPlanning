(define (problem mystery-blocksworld10)
  (:domain mystery-blocksworld)
  (:objects
    a b c d
  )

  (:init
    ;; global harmony
    (harmony)

    ;; initial province/planet facts (from the specification)
    (province a)
    (province b)
    (province c)

    (planet a)
    (planet c)
    (planet d)

    ;; initial craving
    (craves b d)

    ;; explicit distinctness for "other object" constraints
    (distinct a b) (distinct a c) (distinct a d)
    (distinct b a) (distinct b c) (distinct b d)
    (distinct c a) (distinct c b) (distinct c d)
    (distinct d a) (distinct d b) (distinct d c)
  )

  (:goal (and
    (craves b c)
    (craves d a)
  ))
)