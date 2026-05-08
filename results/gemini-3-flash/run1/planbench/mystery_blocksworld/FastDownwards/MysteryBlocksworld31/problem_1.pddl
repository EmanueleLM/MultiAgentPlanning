(define (problem mystery_blocksworld_31_problem)
  (:domain mystery_blocksworld_31)
  (:objects
    a b c d - obj
  )
  (:init
    (craves a c)
    (craves b a)
    (harmony)
    (planet c)
    (planet d)
    (province b)
    (province d)
  )
  (:goal
    (and
      (craves a b)
      (craves b d)
      (craves d c)
    )
  )
)