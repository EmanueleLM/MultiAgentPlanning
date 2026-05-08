(define (problem mystery_blocksworld_36_problem)
  (:domain mystery_blocksworld_36)
  (:objects
    a b c d - obj
  )
  (:init
    (harmony)
    (province a)
    (planet c)
    (craves a d)
    (craves d b)
    (craves b c)
  )
  (:goal
    (and
      (craves a b)
      (craves c a)
    )
  )
)