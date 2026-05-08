(define (problem province-feast-problem)
  (:domain province-feast)

  (:objects
    a b c d - object
    attacker1 - agent
  )

  (:init
    ; initial global fluent
    (harmony)

    ; initial planet/province facts (as provided)
    (planet a)
    (planet b)
    (province b)
    (province d)

    ; initial craving relations
    (craves c a)
    (craves d c)

    ; inequality facts for all ordered distinct object pairs
    (different a b) (different b a)
    (different a c) (different c a)
    (different a d) (different d a)
    (different b c) (different c b)
    (different b d) (different d b)
    (different c d) (different d c)
  )

  ; Goal: object b craves object c AND object d craves object a
  (:goal (and
    (craves b c)
    (craves d a)
  ))
)