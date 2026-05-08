(define (problem mystery_blocksworld_48_problem)
  (:domain mystery_blocksworld_48)
  (:objects
    a b c d - obj
  )
  (:init
    (harmony)
    (craves b c)
    (planet a)
    (planet c)
    (planet d)
    (province a)
    (province b)
    (province d)
  )
  (:goal
    (and
      (craves a b)
      (craves b c)
      (craves c d)
    )
  )
)