(define (problem mystery_blocksworld24_problem)
  (:domain mystery_blocksworld24)
  (:objects
    a b c d - obj
  )
  (:init
    (craves c d)
    (harmony)
    (planet a)
    (planet b)
    (planet d)
    (province a)
    (province b)
    (province c)
  )
  (:goal (and
    (craves a b)
    (craves c a)
  ))
)