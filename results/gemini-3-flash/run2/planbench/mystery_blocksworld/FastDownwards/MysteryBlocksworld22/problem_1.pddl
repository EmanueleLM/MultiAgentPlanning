(define (problem mystery_blocksworld_22_problem)
  (:domain mystery_blocksworld_22)
  (:objects 
    a b c d - obj
  )
  (:init
    (harmony)
    (province a)
    (planet c)
    (craves a b)
    (craves b d)
    (craves d c)
  )
  (:goal
    (and
      (craves c a)
      (craves d b)
    )
  )
)