(define (problem mystery_blocksworld_problem)
  (:domain mystery_blocksworld)
  (:objects a b c d - obj)
  (:init
    (craves a b)
    (craves b d)
    (craves d c)
    (harmony)
    (planet c)
    (province a)
  )
  (:goal
    (and
      (craves c a)
      (craves d b)
    )
  )
)