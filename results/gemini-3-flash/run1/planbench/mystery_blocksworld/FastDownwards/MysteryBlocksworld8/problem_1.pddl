(define (problem mystery_blocksworld_8)
  (:domain mystery_blocksworld)
  (:objects
    a b c d - obj
  )
  (:init
    (craves c b)
    (craves d a)
    (harmony)
    (planet a)
    (planet b)
    (province c)
    (province d)
  )
  (:goal
    (and
      (craves a d)
      (craves b c)
    )
  )
)