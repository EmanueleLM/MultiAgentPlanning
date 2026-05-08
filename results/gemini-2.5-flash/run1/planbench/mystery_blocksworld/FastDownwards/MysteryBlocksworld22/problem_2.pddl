(define (problem mystery_blocksworld22_problem)
  (:domain mystery_blocksworld22)
  (:objects
    a b c d - object
  )
  (:init
    (craves a b)
    (craves b d)
    (craves d c)
    (harmony)
    (planet c)
    (province a)
  )
  (:goal (and
    (craves c a)
    (craves d b)
  ))
)