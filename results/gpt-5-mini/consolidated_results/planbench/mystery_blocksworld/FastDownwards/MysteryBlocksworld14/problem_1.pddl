(define (problem MysteryBlocksworld14-problem)
  (:domain MysteryBlocksworld14)
  ;; Objects: four entities and a linear chain of stages to enforce ordered progression.
  (:objects
    a b c d - entity
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 - stage
  )

  (:init
    ;; Initial facts provided by the human specification:
    (craves d c)
    (harmony)
    (planet a)
    (planet b)
    (planet c)
    (province a)
    (province b)
    (province d)

    ;; Stage initialization: start at s0 and provide a successor chain s0->s1->...->s9.
    (at-stage s0)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
    (succ s6 s7)
    (succ s7 s8)
    (succ s8 s9)
  )

  ;; Goal: require both (craves c b) and (craves d a) to hold in the final state.
  (:goal (and
    (craves c b)
    (craves d a)
  ))
)