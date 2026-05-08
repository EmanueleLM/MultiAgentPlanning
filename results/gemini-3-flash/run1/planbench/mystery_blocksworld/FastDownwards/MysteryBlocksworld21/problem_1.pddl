(define (problem mystery_blocksworld_21_problem)
  (:domain mystery_blocksworld_21)
  (:objects a b c d)
  (:init
    (harmony)
    (craves a d)
    (craves d c)
    (planet b)
    (planet c)
    (province a)
    (province b)
  )
  (:goal
    (and
      (craves b c)
      (craves d a)
    )
  )
)