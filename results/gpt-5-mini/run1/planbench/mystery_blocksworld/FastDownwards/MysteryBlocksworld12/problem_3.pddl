(define (problem mysteryblocksworld12-problem)
  (:domain mysteryblocksworld12)

  (:objects
    a b c d - obj
  )

  (:init
    (object_craves a b)
    (object_craves b c)
    (object_craves c d)
    (harmony)
    (planet d)
    (province a)
  )

  (:goal (and
    (object_craves b c)
    (object_craves c d)
    (object_craves d a)
  ))
)