(define (problem mystery_blocksworld_46_problem)
  (:domain mystery_blocksworld_46)
  (:objects
    a b c d - object
  )
  (:init
    (craves a d)
    (craves b a)
    (craves c b)
    (harmony)
    (planet d)
    (province c)
  )
  (:goal
    (and (craves a b))
  )
)