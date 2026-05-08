(define (problem mystery_blocksworld_7_problem)
  (:domain mystery_blocksworld_7)
  (:objects
    a b c d - obj
  )
  (:init
    (craves c d)
    (craves d a)
    (harmony)
    (planet a)
    (planet b)
    (province b)
    (province c)
  )
  (:goal
    (and
      (craves a c)
      (craves b a)
      (craves d b)
    )
  )
)