(define (problem mystery_blocksworld38_problem)
  (:domain mystery_blocksworld38)
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
  (:goal (and
    (craves a c)
    (craves c d)
    (craves d b)
  ))
)