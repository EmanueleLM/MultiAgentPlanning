(define (problem mystery_blocksworld_42_problem)
  (:domain mystery_blocksworld_42)
  (:objects
    a b c d - obj
  )
  (:init
    (craves a c)
    (craves c b)
    (craves b d)
    (harmony)
    (planet d)
    (province a)
  )
  (:goal
    (and
      (craves a d)
      (craves b a)
    )
  )
)