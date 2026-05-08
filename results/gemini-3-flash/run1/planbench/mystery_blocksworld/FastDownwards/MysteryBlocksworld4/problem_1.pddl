(define (problem mystery_blocksworld_4)
  (:domain mystery_blocksworld)
  (:objects
    a b c d - obj
  )
  (:init
    (craves a c)
    (craves c b)
    (craves d a)
    (harmony)
    (planet b)
    (province d)
  )
  (:goal
    (and
      (craves a b)
      (craves d c)
    )
  )
)