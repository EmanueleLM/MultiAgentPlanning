(define (problem problem_jack_of_all_trades)
  (:domain jack_of_all_trades)
  (:objects
    object_a object_b object_c object_d - object
  )
  (:init
    (craves object_a object_b)
    (craves object_b object_d)
    (harmony)
    (planet object_c)
    (planet object_d)
    (province object_a)
    (province object_c)
  )
  (:goal (and
    (craves object_b object_d)
    (craves object_c object_a)
    (craves object_d object_c)
  ))
)