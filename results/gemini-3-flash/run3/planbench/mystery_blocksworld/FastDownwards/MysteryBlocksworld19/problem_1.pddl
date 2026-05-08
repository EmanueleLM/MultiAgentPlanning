(define (problem mystery_blocksworld_19_problem)
  (:domain mystery_blocksworld_19)
  (:objects
    a b c d - obj
  )
  (:init
    (craves a c)
    (craves d a)
    (harmony)
    (planet b)
    (planet c)
    (province b)
    (province d)
  )
  (:goal
    (and
      (craves a c)
      (craves b d)
      (craves d a)
    )
  )
)