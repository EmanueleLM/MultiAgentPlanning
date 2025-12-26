(define (problem MysteryBlocksworld4_Instance)
  (:domain MysteryBlocksworld4)
  
  (:objects
    a b c d - object
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