(define (problem mystery_blocksworld_5_problem)
  (:domain mystery_blocksworld_5)
  (:objects
    a b c d - object
  )
  (:init
    (craves a d)
    (craves b c)
    (craves d b)
    (harmony)
    (planet c)
    (province a)
  )
  (:goal
    (and
      (craves a c)
    )
  )
)