(define (problem mystery_blocksworld30_problem)
  (:domain mystery_blocksworld30)
  (:objects
    a b c d - object
  )
  (:init
    (craves a d)
    (craves c b)
    (harmony)
    (planet b)
    (planet d)
    (province a)
    (province c)
  )
  (:goal (and
    (craves a d)
    (craves d c)
  ))
)