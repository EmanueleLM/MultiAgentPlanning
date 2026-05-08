(define (problem jack_of_all_trades_instance)
  (:domain jack_of_all_trades)
  (:objects
    object_a - object
    object_b - object
    object_c - object
    object_d - object
  )
  (:init
    (craves object_c object_b)
    (craves object_d object_a)
    (harmony)
    (planet object_a)
    (planet object_b)
    (province object_c)
    (province object_d)
  )
  (:goal 
    (and 
      (craves object_a object_d)
      (craves object_b object_c)
    )
  )
)