(define (problem mystery_blocksworld_40_problem)
  (:domain mystery_blocksworld_40)
  (:objects
    a b c d - obj
  )
  (:init
    (craves b a)
    (harmony)
    (planet a)
    (planet c)
    (planet d)
    (province b)
    (province c)
    (province d)
  )
  (:goal
    (and
      (craves a b)
      (craves b c)
      (craves d a)
    )
  )
)