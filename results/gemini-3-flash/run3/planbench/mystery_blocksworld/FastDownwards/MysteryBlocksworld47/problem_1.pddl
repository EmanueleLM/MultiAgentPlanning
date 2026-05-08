(define (problem mystery_blocksworld_47_problem)
  (:domain mystery_blocksworld_47)
  (:objects a b c d)
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
      (craves c a)
      (craves d c)
    )
  )
)