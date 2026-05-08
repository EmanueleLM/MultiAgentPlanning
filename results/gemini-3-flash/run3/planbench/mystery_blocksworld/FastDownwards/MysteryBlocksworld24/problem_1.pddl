(define (problem mystery_blocksworld_24_problem)
  (:domain mystery_blocksworld_24)
  (:objects
    a b c d - object
  )
  (:init
    (harmony)
    (craves c d)
    (planet a)
    (planet b)
    (planet d)
    (province a)
    (province b)
    (province c)
  )
  (:goal
    (and
      (craves a b)
      (craves c a)
    )
  )
)