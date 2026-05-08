(define (problem mystery_blocksworld_39_prob)
  (:domain mystery_blocksworld_39)
  (:objects
    a b c d - obj
  )
  (:init
    (harmony)
    (craves b c)
    (craves c a)
    (planet a)
    (planet d)
    (province b)
    (province d)
  )
  (:goal
    (and
      (craves b d)
      (craves c a)
    )
  )
)