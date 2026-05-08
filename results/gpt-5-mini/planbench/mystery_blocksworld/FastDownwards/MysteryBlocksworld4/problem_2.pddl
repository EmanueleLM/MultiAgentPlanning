(define (problem mystery_blocksworld4-prob)
  (:domain mystery_blocksworld4)
  (:objects
    a b c d - item
  )
  (:init
    (craves a c)
    (craves c b)
    (craves d a)
    (harmony)
    (planet b)
    (province d)
  )
  (:goal (and
    (craves a b)
    (craves d c)
  ))
)