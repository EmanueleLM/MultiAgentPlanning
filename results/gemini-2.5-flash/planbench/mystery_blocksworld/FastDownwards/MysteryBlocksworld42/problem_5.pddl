(define (problem mystery_blocksworld42_problem)
  (:domain mystery_blocksworld42)
  (:objects
    a b c d - thing
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
    (craves a d)
    (craves b a)
  ))
)