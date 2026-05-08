(define (problem mystery_blocksworld_33)
  (:domain mystery_blocksworld)
  (:objects
    a b c d - obj
  )
  (:init
    (craves a d)
    (craves c a)
    (craves d b)
    (harmony)
    (planet b)
    (province c)
  )
  (:goal
    (and
      (craves d c)
    )
  )
)