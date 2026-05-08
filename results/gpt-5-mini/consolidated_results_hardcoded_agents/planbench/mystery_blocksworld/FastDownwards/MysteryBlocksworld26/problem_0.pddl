(define (problem provinces-problem)
  (:domain provinces)
  (:objects
    a b c d - obj
  )
  (:init
    ; initial craving relations
    (craves a b)
    (craves b d)

    ; initial global booleans
    (harmony)

    ; initial planets
    (planet c)
    (planet d)

    ; initial provinces (note: this encoding allows multiple provinces simultaneously)
    (province a)
    (province c)

    ; explicit distinctness facts for all ordered unequal pairs (used to enforce inequality constraints)
    (different a b) (different a c) (different a d)
    (different b a) (different b c) (different b d)
    (different c a) (different c b) (different c d)
    (different d a) (different d b) (different d c)
  )

  (:goal (and
    (craves b d)
    (craves c a)
    (craves d c)
  ))
)