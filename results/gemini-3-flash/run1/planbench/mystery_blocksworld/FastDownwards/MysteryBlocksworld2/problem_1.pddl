(define (problem mystery_blocksworld_2_problem)
  (:domain mystery_blocksworld_2)
  (:objects a b c d - obj)
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
      (craves a d)
      (craves d b)
    )
  )
)