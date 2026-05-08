(define (problem mystery_blocksworld_1)
  (:domain mystery_blocksworld)
  (:objects a b c d)
  (:init
    (harmony)
    (planet a)
    (province b)
    (craves b c)
    (craves c d)
    (craves d a)
  )
  (:goal
    (and
      (craves a c)
      (craves d a)
    )
  )
)