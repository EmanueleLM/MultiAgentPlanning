(define (problem mystery_blocksworld_38_prob)
  (:domain mystery_blocksworld_38)
  (:objects a b c d)
  (:init
    (harmony)
    (province c)
    (planet b)
    (craves a b)
    (craves c d)
    (craves d a)
  )
  (:goal
    (and
      (craves a c)
      (craves c d)
      (craves d b)
    )
  )
)