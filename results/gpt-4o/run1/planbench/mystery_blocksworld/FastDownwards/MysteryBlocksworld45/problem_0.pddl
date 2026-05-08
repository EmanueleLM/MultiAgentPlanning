(define (problem jack_of_all_trades_instance)
  (:domain jack_of_all_trades)
  (:objects
    object_a object_b object_c object_d - object
  )
  (:init
    (object_craves object_a object_d)
    (object_craves object_c object_a)
    (harmony)
    (planet object_b)
    (planet object_d)
    (province object_b)
    (province object_c)
  )
  (:goal
    (and
      (object_craves object_a object_d)
      (object_craves object_b object_a)
      (object_craves object_d object_c)
    )
  )
)