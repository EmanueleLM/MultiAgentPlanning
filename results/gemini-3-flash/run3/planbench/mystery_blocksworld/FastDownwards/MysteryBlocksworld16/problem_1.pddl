(define (problem mystery_blocksworld_16_problem)
  (:domain mystery_blocksworld_16)
  (:objects a b c d)
  (:init
    (harmony)
    (craves a c)
    (craves b a)
    (craves d b)
    (planet c)
    (province d)
  )
  (:goal
    (and
      (craves b c)
      (craves c d)
    )
  )
)