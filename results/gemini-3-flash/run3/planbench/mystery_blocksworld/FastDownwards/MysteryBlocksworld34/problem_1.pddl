(define (problem mystery_blocksworld_34_problem)
  (:domain mystery_blocksworld_34)
  (:objects
    a b c d - object
  )
  (:init
    (craves b d)
    (craves d c)
    (harmony)
    (planet a)
    (planet c)
    (province a)
    (province b)
  )
  (:goal
    (and
      (craves b a)
      (craves c b)
    )
  )
)