(define (problem mystery_blocksworld_3_problem)
  (:domain mystery_blocksworld_3)
  (:objects
    a b c d
  )
  (:init
    (craves b a)
    (craves c b)
    (harmony)
    (planet a)
    (planet d)
    (province c)
    (province d)
  )
  (:goal
    (and
      (craves b a)
      (craves d c)
    )
  )
)