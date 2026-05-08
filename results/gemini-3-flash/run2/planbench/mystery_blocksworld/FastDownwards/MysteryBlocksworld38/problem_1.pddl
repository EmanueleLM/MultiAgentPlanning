(define (problem mystery_blocksworld_38_problem)
  (:domain mystery_blocksworld_38)
  (:objects
    a b c d - obj
  )
  (:init
    (harmony)
    (craves a b)
    (craves c d)
    (craves d a)
    (planet b)
    (province c)
  )
  (:goal
    (and
      (craves a c)
      (craves c d)
      (craves d b)
    )
  )
)