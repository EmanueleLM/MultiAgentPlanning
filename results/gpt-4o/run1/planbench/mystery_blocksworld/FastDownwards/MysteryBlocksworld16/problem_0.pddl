(define (problem jack_of_all_trades_instance)
  (:domain jack_of_all_trades)
  (:objects 
    object_a object_b object_c object_d - object
  )
  (:init
    (object_craves object_a object_c)
    (object_craves object_b object_a)
    (object_craves object_d object_b)
    (harmony)
    (planet object_c)
    (province object_d)
  )
  (:goal
    (and 
      (object_craves object_b object_c)
      (object_craves object_c object_d)
    )
  )
)