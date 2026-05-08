(define (problem mystery_blocksworld_30_prob)
  (:domain mystery_blocksworld_30)
  (:objects
    a b c d - element
  )
  (:init
    (harmony)
    (craves a d)
    (craves c b)
    (planet b)
    (planet d)
    (province a)
    (province c)
  )
  (:goal
    (and
      (craves a d)
      (craves d c)
    )
  )
)