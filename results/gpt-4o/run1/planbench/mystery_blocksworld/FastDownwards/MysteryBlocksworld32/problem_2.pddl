(define (problem mystery_blocksworld_problem)
  (:domain mystery_blocksworld)
  (:objects
    object_a object_b object_c object_d - object
  )
  (:init
    (craves object_a object_c)
    (craves object_b object_a)
    (harmony)
    (planet object_c)
    (planet object_d)
    (province object_b)
    (province object_d)
  )
  (:goal
    (and
      (craves object_a object_c)
      (craves object_d object_b)
    )
  )
)