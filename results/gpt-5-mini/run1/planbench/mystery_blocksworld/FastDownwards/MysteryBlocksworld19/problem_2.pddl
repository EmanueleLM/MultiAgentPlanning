(define (problem mysteryblocksworld19-problem)
  (:domain mysteryblocksworld19)
  (:objects
    a b c d - object
  )
  (:init
    ;; initial facts from the specification
    (craves a c)
    (craves d a)
    (harmony)
    (planet b)
    (planet c)
    (province b)
    (province d)
  )
  (:goal (and
    (craves a c)
    (craves b d)
    (craves d a)
  ))
)