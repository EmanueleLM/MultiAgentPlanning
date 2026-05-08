(define (problem mystery_blocksworld_1)
  (:domain mystery_blocksworld)
  (:objects
    a b c d - obj
  )
  (:init
    (craves b c)
    (craves c d)
    (craves d a)
    (harmony)
    (planet a)
    (province b)
  )
  (:goal
    (and
      (craves a c)
      (craves d a)
    )
  )
)