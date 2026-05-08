(define (problem mysteryblocksworld25-problem)
  (:domain mysteryblocksworld25)
  (:objects
    a b c d - object
  )
  (:init
    (craves b d)
    (craves c a)
    (harmony)
    (planet a)
    (planet d)
    (province b)
    (province c)
  )
  (:goal (and
    (craves a c)
    (craves d a)
  ))
)