(define (problem mystery_blocksworld_41_prob)
  (:domain mystery_blocksworld_41)
  (:objects
    a b c d - obj
  )
  (:init
    (craves a b)
    (craves d a)
    (harmony)
    (planet b)
    (planet c)
    (province c)
    (province d)
  )
  (:goal
    (and
      (craves a c)
      (craves c b)
    )
  )
)