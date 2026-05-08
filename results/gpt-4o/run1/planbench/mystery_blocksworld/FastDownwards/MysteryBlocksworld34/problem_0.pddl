(define (problem jack_of_all_trades_instance)
  (:domain jack_of_all_trades)
  (:objects 
    object_a object_b object_c object_d - object
  )
  (:init 
    (craves object_b object_d)
    (craves object_d object_c)
    (harmony)
    (planet object_a)
    (planet object_c)
    (province object_a)
    (province object_b)
  )
  (:goal (and 
    (craves object_b object_a)
    (craves object_c object_b)
  ))
)