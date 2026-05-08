(define (problem specific_instance)
  (:domain jack_of_all_trades)
  (:objects 
    object_a object_b object_c object_d - object
  )
  (:init 
    (craves object_a object_b)
    (craves object_d object_c)
    (harmony)
    (planet object_b)
    (planet object_c)
    (province object_a)
    (province object_d)
  )
  (:goal 
    (craves object_c object_a)
  )
)