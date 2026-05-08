(define (problem mystery_blocksworld_37)
  (:domain mystery_blocksworld)
  (:objects
    a b c d - obj
  )
  (:init
    (harmony)
    (planet a)
    (planet b)
    (province a)
    (province d)
    (craves c b)
    (craves d c)
  )
  (:goal
    (and
      (craves a b)
      (craves c d)
      (craves d a)
    )
  )
)