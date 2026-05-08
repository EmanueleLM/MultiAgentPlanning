(define (problem mystery_blocksworld_instance)
  (:domain mystery_blocksworld)
  (:objects
    a b c d - object
  )
  (:init
    (craves a c)
    (craves b a)
    (craves d b)
    (harmony)
    (planet c)
    (province d)
  )
  (:goal (and
    (craves b c)
    (craves c d)
  ))
)