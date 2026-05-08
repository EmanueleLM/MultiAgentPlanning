(define (problem mystery_blocksworld33_problem)
  (:domain mystery_blocksworld33)
  (:objects
    a b c d - object
  )
  (:init
    (craves a d)
    (craves c a)
    (craves d b)
    (harmony)
    (planet b)
    (province c)
  )
  (:goal (craves d c))
)