(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades)
  (:objects
    object_a object_b object_c object_d - object_type)
  (:init
    (craves object_a object_c)
    (craves object_c object_b)
    (craves object_d object_a)
    (harmony)
    (planet object_b)
    (province object_d))
  (:goal (and
    (craves object_a object_b)
    (craves object_d object_c)))
)