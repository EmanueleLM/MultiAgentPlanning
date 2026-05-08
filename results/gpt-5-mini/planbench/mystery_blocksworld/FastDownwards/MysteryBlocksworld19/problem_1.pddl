(define (problem mystery_blocksworld19)
  (:domain mystery_blocksworld)

  (:objects
    a b c d - object
  )

  (:init
    ;; initial cravings
    (craves a c)
    (craves d a)

    ;; initial global harmony
    (harmony)

    ;; initial planet membership
    (planet b)
    (planet c)

    ;; initial province holders
    (province b)
    (province d)

    ;; explicit distinctness for all ordered distinct pairs
    (different a b) (different a c) (different a d)
    (different b a) (different b c) (different b d)
    (different c a) (different c b) (different c d)
    (different d a) (different d b) (different d c)
  )

  (:goal (and
    (craves a c)
    (craves b d)
    (craves d a)
  ))
)