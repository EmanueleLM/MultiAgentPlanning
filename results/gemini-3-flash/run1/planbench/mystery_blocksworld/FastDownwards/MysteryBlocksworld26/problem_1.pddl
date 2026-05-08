(define (problem mystery_blocksworld_26_problem)
  (:domain mystery_blocksworld_26)
  (:objects
    a b c d - object
  )
  (:init
    (craves a b)
    (craves b d)
    (harmony)
    (planet c)
    (planet d)
    (province a)
    (province c)
  )
  (:goal
    (and
      (craves b d)
      (craves c a)
      (craves d c)
    )
  )
)