(define (problem mystery_blocksworld_38)
  (:domain mystery_blocksworld)
  (:objects
    a b c d - object
  )
  (:init
    (craves a b)
    (craves c d)
    (craves d a)
    (harmony)
    (planet b)
    (province c)
  )
  (:goal
    (and
      (craves a c)
      (craves c d)
      (craves d b)
    )
  )
)