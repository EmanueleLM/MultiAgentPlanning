(define (problem mystery_blocksworld_35)
  (:domain mystery_blocksworld)
  (:objects
    a b c d - obj
  )
  (:init
    (harmony)
    (craves b d)
    (craves d a)
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