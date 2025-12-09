(define (problem MysteryBlocksworld14-problem)
  (:domain MysteryBlocksworld14)

  (:objects
    a b c d - entity
  )

  (:init
    ;; Initial facts from the specification (kept minimal: only the stated facts)
    (craves d c)
    (harmony)
    (planet a)
    (planet b)
    (planet c)
    (province a)
    (province b)
    (province d)
  )

  (:goal (and
    (craves c b)
    (craves d a)
  ))
)