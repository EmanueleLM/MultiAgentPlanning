(define (problem mystery_blocksworld_4_problem)
  (:domain mystery_blocksworld_4)
  (:objects
    a b c d - obj
  )
  (:init
    (harmony)
    (planet b)
    (province d)
    (craves a c)
    (craves c b)
    (craves d a)
  )
  (:goal
    (and
      (craves a b)
      (craves d c)
    )
  )
)