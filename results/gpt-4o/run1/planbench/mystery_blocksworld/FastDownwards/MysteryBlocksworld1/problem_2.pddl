(define (problem transformation_problem)
  (:domain transformation_domain)
  (:objects a b c d - object)
  (:init 
    (object_craves b c)
    (object_craves c d)
    (object_craves d a)
    (harmony)
    (planet a)
    (province b)
  )
  (:goal 
    (and 
      (object_craves a c)
      (object_craves d a)
    )
  )
)