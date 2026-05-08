(define (problem specific_object_management)
  (:domain object_management)
  (:objects 
    a b c d - object
  )
  (:init 
    (craves a d)
    (craves d c)
    (harmony)
    (planet b)
    (planet c)
    (province a)
    (province b)
  )
  (:goal 
    (and (craves b c) (craves c d))
  )
)