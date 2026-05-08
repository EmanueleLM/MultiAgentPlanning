(define (problem mystery_blocksworld_8)
  (:domain mystery_blocksworld)
  (:objects
    a b c d - object
  )
  (:init
    (harmony)
    (planet a)
    (planet b)
    (province c)
    (province d)
    (craves c b)
    (craves d a)
  )
  (:goal
    (and
      (craves a d)
      (craves b c)
    )
  )
)