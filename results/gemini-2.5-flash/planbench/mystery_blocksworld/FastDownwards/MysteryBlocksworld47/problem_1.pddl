(define (problem mystery_blocksworld47_problem)
  (:domain mystery_blocksworld47)
  (:objects
    a b c d - object
  )
  (:init
    (craves a c)
    (craves b d)
    (craves c b)
    (harmony)
    (planet d)
    (province a)
  )
  (:goal (and
    (craves b d)
    (craves c a)
    (craves d c)
  ))
)