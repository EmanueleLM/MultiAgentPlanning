(define (problem mystery_blocksworld_47_problem)
  (:domain mystery_blocksworld_47)
  (:objects
    a b c d - obj
  )
  (:init
    (harmony)
    (province a)
    (planet d)
    (craves a c)
    (craves c b)
    (craves b d)
  )
  (:goal
    (and
      (craves b d)
      (craves d c)
      (craves c a)
    )
  )
)