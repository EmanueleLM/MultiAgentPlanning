(define (problem mystery_blocksworld3_problem)
  (:domain mystery_blocksworld3)
  (:objects
    a b c d - obj
  )
  (:init
    (object_craves b a)
    (object_craves c b)
    (harmony)
    (planet a)
    (planet d)
    (province c)
    (province d)
  )
  (:goal (and
    (object_craves b a)
    (object_craves d c)
  ))
)