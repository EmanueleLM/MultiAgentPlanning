(define (problem mystery_blocksworld_9_prob)
  (:domain mystery_blocksworld_9)
  (:objects
    a b c d - object
  )
  (:init
    (harmony)
    (craves a d)
    (craves b c)
    (planet c)
    (planet d)
    (province a)
    (province b)
  )
  (:goal
    (and
      (craves b d)
      (craves d a)
    )
  )
)