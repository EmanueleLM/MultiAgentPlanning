(define (problem mystery_blocksworld_13_problem)
  (:domain mystery_blocksworld_13)
  (:objects
    a b c d - object
  )
  (:init
    (harmony)
    (craves b d)
    (craves c b)
    (planet a)
    (planet d)
    (province a)
    (province c)
  )
  (:goal
    (and
      (craves a c)
      (craves b a)
    )
  )
)