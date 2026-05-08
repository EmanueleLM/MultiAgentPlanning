(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades)
  (:objects
    object_a object_b object_c object_d - object
  )
  (:init
    (object_craves object_a object_d)
    (object_craves object_b object_c)
    (harmony)
    (planet object_c)
    (planet object_d)
    (province object_a)
    (province object_b)
  )
  (:goal
    (and
      (object_craves object_b object_d)
      (object_craves object_d object_a)
    )
  )
)