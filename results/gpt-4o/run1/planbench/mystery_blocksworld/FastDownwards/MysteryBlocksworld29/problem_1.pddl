(define (problem specific_jack_of_all_trades)
  (:domain jack_of_all_trades)
  (:objects 
    object_a object_b object_c object_d - object
  )
  (:init 
    (craves object_a object_c)
    (craves object_b object_d)
    (harmony)
    (planet object_c)
    (planet object_d)
    (province object_a)
    (province object_b)
  )
  (:goal 
    (and 
      (craves object_a object_c)
      (craves object_b object_a)
    )
  )
)