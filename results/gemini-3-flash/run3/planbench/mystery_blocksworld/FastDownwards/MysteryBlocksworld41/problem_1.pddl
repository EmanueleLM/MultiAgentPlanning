(define (problem mystery_blocksworld_41_problem)
  (:domain mystery_blocksworld_41)
  (:objects
    a b c d - item
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