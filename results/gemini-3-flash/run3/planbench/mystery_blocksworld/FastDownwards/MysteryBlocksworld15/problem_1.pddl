(define (problem mystery_blocksworld_15_problem)
  (:domain mystery_blocksworld_15)
  (:objects
    a b c d - obj
  )
  (:init
    (craves a d)
    (craves d c)
    (harmony)
    (planet b)
    (planet c)
    (province a)
    (province b)
  )
  (:goal
    (and
      (craves b c)
      (craves c d)
    )
  )
)