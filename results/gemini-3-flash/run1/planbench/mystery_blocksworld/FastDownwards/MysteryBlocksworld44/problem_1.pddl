(define (problem mystery_blocksworld_44_prob)
  (:domain mystery_blocksworld_44)
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
      (craves b c)
    )
  )
)