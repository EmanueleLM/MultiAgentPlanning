(define (problem mysteryblocksworld12-problem)
  (:domain mysteryblocksworld12)

  (:objects
    a b c d - obj
  )

  (:init
    (craves a b)
    (craves b c)
    (craves c d)
    (harmony)
    (planet d)
    (province a)
  )

  (:goal (and
    (craves b c)
    (craves c d)
    (craves d a)
  ))
)