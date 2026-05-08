(define (problem mystery_blocksworld_35_prob)
  (:domain mystery_blocksworld_35)
  (:objects
    a b c d - obj
  )
  (:init
    (craves b d)
    (craves d a)
    (harmony)
    (planet a)
    (planet c)
    (province b)
    (province c)
  )
  (:goal
    (and
      (craves b a)
      (craves c d)
    )
  )
)