(define (problem mystery_blocksworld_30_problem)
  (:domain mystery_blocksworld_30)
  (:objects
    a b c d - object
  )
  (:init
    (harmony)
    (planet b)
    (planet d)
    (province a)
    (province c)
    (craves a d)
    (craves c b)
  )
  (:goal
    (and
      (craves a d)
      (craves d c)
    )
  )
)