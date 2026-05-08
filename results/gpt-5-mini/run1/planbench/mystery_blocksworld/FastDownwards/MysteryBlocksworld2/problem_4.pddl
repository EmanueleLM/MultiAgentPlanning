(define (problem mystery_blocksworld2_instance)
  (:domain mystery_blocksworld)
  (:objects
    a b c d - obj
  )
  (:init
    (craves a c)
    (craves c b)
    (craves d a)
    (harmony)
    (planet b)
    (province d)
  )
  (:goal (and
    (craves a d)
    (craves d b)
  ))
)