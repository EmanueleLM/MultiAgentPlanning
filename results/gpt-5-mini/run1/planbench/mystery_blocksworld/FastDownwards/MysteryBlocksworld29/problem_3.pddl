(define (problem mystery-blocksworld29-prob)
  (:domain mystery-blocksworld29)
  (:objects
    a b c d - object
  )
  (:init
    (craves a c)
    (craves b d)
    (harmony)
    (planet c)
    (planet d)
    (province a)
    (province b)

    ;; explicit inequality facts to enforce distinct-argument requirements
    (different a b) (different a c) (different a d)
    (different b a) (different b c) (different b d)
    (different c a) (different c b) (different c d)
    (different d a) (different d b) (different d c)
  )
  (:goal (and
    (craves a c)
    (craves b a)
  ))
)