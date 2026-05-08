(define (problem mystery_blocksworld_25_prob)
  (:domain mystery_blocksworld_25)
  (:objects
    a b c d - obj
  )
  (:init
    (craves b d)
    (craves c a)
    (harmony)
    (planet a)
    (planet d)
    (province b)
    (province c)
  )
  (:goal
    (and
      (craves a c)
      (craves d a)
    )
  )
)