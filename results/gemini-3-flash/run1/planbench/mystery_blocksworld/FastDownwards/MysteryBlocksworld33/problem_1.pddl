(define (problem mystery_blocksworld_33_problem)
  (:domain mystery_blocksworld_33)
  (:objects a b c d - object)
  (:init
    (craves a d)
    (craves c a)
    (craves d b)
    (harmony)
    (planet b)
    (province c)
  )
  (:goal
    (and
      (craves d c)
    )
  )
)