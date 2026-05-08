(define (problem mystery_blocksworld10)
  (:domain mystery_blocksworld)
  (:objects
    object_a object_b object_c object_d - obj
  )
  (:init
    ;; initial craving and global harmony
    (craves object_b object_d)
    (harmony)

    ;; initial planets
    (planet object_a)
    (planet object_c)
    (planet object_d)

    ;; initial provinces
    (province object_a)
    (province object_b)
    (province object_c)
  )
  (:goal (and
    (craves object_b object_c)
    (craves object_d object_a)
  ))
)