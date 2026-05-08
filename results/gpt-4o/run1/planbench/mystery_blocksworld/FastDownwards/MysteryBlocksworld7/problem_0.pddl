(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades)
  (:objects
    object_a object_b object_c object_d - object_type
  )
  (:init
    (craves object_c object_d)
    (craves object_d object_a)
    (harmony)
    (planet object_a)
    (planet object_b)
    (province object_b)
    (province object_c)
  )
  (:goal (and
    (craves object_a object_c)
    (craves object_b object_a)
    (craves object_d object_b)
  ))
)