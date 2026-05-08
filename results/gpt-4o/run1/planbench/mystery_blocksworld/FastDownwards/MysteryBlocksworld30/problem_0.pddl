(define (problem object_craving)
  (:domain object_management)
  (:objects 
    object_a - object
    object_b - object
    object_c - object
    object_d - object
  )
  (:init 
    (craves object_a object_d)
    (craves object_c object_b)
    (harmony)
    (planet object_b)
    (planet object_d)
    (province object_a)
    (province object_c)
  )
  (:goal (and 
    (craves object_a object_d)
    (craves object_d object_c)
  ))
)