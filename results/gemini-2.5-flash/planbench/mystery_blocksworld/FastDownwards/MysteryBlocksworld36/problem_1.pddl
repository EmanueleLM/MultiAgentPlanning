(define (problem mystery_blocksworld36_problem)
  (:domain mystery_blocksworld36)
  (:objects
    a b c d - object
  )
  (:init
    (craves a d)
    (craves b c)
    (craves d b)
    (harmony)
    (planet c)
    (province a)
  )
  (:goal (and
    (craves a b)
    (craves c a)
  ))
)