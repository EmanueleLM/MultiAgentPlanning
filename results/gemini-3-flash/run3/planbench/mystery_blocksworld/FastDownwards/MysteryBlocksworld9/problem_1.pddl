(define (problem mystery_blocksworld_9_prob)
  (:domain mystery_blocksworld_9)
  (:objects
    a b c d - obj
  )
  (:init
    (craves a d)
    (craves b c)
    (harmony)
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