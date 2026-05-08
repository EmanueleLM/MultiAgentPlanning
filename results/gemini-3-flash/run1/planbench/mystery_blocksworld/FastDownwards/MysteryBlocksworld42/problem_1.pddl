(define (problem mystery_blocksworld_42_problem)
  (:domain mystery_blocksworld_42)
  (:objects
    a b c d - obj
  )
  (:init
    (harmony)
    (planet d)
    (province a)
    (craves a c)
    (craves c b)
    (craves b d)
  )
  (:goal
    (and
      (craves a d)
      (craves b a)
    )
  )
)