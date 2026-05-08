(define (problem mystery_blocksworld13_problem)
  (:domain mystery_blocksworld13)
  (:objects
    a b c d - object
  )
  (:init
    (craves b d)
    (craves c b)
    (harmony)
    (planet a)
    (planet d)
    (province a)
    (province c)
  )
  (:goal (and
    (craves a c)
    (craves b a)
  ))
)