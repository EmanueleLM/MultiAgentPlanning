(define (problem manipulate_objects_problem)
  (:domain manipulate_objects)
  (:objects
    object_a object_b object_c object_d - object
  )
  (:init
    (craves object_a object_d)
    (craves object_c object_a)
    (harmony)
    (planet object_b)
    (planet object_d)
    (province object_b)
    (province object_c)
  )
  (:goal (and
    (craves object_a object_b)
    (craves object_c object_a)
    (craves object_d object_c)
  ))
)