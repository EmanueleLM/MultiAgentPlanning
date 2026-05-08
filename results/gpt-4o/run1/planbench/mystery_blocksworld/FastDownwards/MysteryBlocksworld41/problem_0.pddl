(define (problem object_transition_problem)
  (:domain object_transitions)
  (:objects 
    object_a object_b object_c object_d - object
  )
  (:init 
    (craves object_a object_b)
    (craves object_d object_a)
    (harmony)
    (planet object_b)
    (planet object_c)
    (province object_c)
    (province object_d)
  )
  (:goal 
    (and 
      (craves object_a object_c)
      (craves object_c object_b)
    )
  )
)