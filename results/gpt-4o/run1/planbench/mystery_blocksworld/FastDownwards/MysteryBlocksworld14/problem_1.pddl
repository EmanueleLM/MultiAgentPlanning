(define (problem mystery_blocksworld_14_problem)
  (:domain mystery_blocksworld_14)
  (:objects 
    a - object
    b - object
    c - object
    d - object
  )
  (:init 
    (craves d c)
    (harmony)
    (planet a)
    (planet b)
    (planet c)
    (province a)
    (province b)
    (province d)
  )
  (:goal (and 
    (craves c b)
    (craves d a)
  ))
)