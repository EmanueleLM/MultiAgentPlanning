(define (problem object_manipulation_instance)
  (:domain object_manipulation)
  (:objects
    a b c d - object
  )
  (:init
    (craves c b)
    (craves d a)
    (harmony)
    (planet a)
    (planet b)
    (province c)
    (province d)
  )
  (:goal
    (craves a b)
  )
)