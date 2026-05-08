(define (problem mystery_blocksworld14_prob)
  (:domain mystery_blocksworld14)
  (:objects
    a b c d
  )
  (:init
    (harmony)
    (craves d c)
    (planet a)
    (planet b)
    (planet c)
    (province a)
    (province b)
    (province d)
  )
  (:goal
    (and
      (craves c b)
      (craves d a)
    )
  )
)