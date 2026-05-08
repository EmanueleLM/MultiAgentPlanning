(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades)
  (:objects
    object_a object_b object_c object_d - object
  )
  (:init
    (craves object_a object_c)
    (craves object_b object_d)
    (craves object_c object_b)
    (harmony)
    (planet object_d)
    (province object_a)
  )
  (:goal
    (and 
      (craves object_a object_d)
      (craves object_b object_a)
    )
  )
)