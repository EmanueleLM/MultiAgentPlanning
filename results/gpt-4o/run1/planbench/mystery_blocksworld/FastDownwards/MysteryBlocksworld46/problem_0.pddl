(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades_domain)
  (:objects
    object_a - object
    object_b - object
    object_c - object
    object_d - object
  )
  (:init
    (craves object_a object_d)
    (craves object_b object_a)
    (craves object_c object_b)
    (harmony)
    (planet object_d)
    (province object_c)
  )
  (:goal
    (craves object_a object_b)
  )
)