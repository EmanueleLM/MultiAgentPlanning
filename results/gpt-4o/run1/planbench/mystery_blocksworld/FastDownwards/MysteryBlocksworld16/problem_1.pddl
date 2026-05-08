(define (problem mystery_blocksworld_instance)
  (:domain mystery_blocksworld)
  (:objects 
    object_a object_b object_c object_d - object
  )
  (:init
    (craves object_a object_c)
    (craves object_b object_a)
    (craves object_d object_b)
    (harmony)
    (planet object_c)
    (province object_d)
  )
  (:goal
    (and 
      (craves object_b object_c)
      (craves object_c object_d)
    )
  )
)