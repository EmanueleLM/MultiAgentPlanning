(define (problem mystery_blocksworld_17_problem)
  (:domain mystery_blocksworld_17)
  (:objects
    a b c d - obj
  )
  (:init
    (craves a d)
    (craves c a)
    (harmony)
    (planet b)
    (planet d)
    (province b)
    (province c)
  )
  (:goal
    (and
      (craves a b)
      (craves c a)
      (craves d c)
    )
  )
)