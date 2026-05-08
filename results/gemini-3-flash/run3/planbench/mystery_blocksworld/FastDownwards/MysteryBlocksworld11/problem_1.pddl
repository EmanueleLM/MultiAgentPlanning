(define (problem mystery_blocksworld_11_problem)
  (:domain mystery_blocksworld_11)
  (:objects 
    a b c d - obj
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
    (craves a b)
  )
)