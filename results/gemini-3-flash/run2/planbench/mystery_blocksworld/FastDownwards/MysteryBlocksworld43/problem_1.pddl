(define (problem mystery_blocksworld_43_problem)
  (:domain mystery_blocksworld_43)
  (:objects
    a b c d - obj
  )
  (:init
    (craves c a)
    (harmony)
    (planet a)
    (planet b)
    (planet d)
    (province b)
    (province c)
    (province d)
  )
  (:goal
    (and
      (craves b c)
      (craves d b)
    )
  )
)