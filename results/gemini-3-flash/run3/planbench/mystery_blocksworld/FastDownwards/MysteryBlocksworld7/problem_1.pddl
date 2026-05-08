(define (problem mystery_blocksworld_7_problem)
  (:domain mystery_blocksworld_7)
  (:objects
    a b c d - obj
  )
  (:init
    (harmony)
    (planet a)
    (planet b)
    (province b)
    (province c)
    (craves c d)
    (craves d a)
  )
  (:goal
    (and
      (craves a c)
      (craves b a)
      (craves d b)
    )
  )
)