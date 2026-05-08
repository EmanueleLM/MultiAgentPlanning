(define (problem mysteryblocksworld24-problem)
  (:domain mysteryblocksworld24)

  (:objects
    a b c d - object
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