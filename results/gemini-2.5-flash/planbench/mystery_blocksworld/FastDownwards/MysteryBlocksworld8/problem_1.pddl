(define (problem mystery_blocksworld_8)
  (:domain mystery_blocksworld)
  (:objects
    a b c d - item
  )
  (:init
    (object_craves c b)
    (object_craves d a)
    (harmony)
    (planet a)
    (planet b)
    (province c)
    (province d)
  )
  (:goal (and
    (object_craves a d)
    (object_craves b c)
  ))
)