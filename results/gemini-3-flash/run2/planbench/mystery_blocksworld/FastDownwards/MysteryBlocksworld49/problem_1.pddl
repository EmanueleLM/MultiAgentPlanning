(define (problem mystery_blocksworld_49_problem)
  (:domain mystery_blocksworld_49)
  (:objects
    a b c d - obj
  )
  (:init
    (harmony)
    (craves a c)
    (craves d b)
    (planet b)
    (planet c)
    (province a)
    (province d)
  )
  (:goal
    (and
      (craves a b)
      (craves b c)
      (craves c d)
    )
  )
)