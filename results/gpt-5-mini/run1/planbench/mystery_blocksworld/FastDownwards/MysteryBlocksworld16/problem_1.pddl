(define (problem mysteryblocksworld16-problem)
  (:domain mysteryblocksworld16)

  (:objects
    a b c d - obj
  )

  (:init
    ;; craving relations
    (craves a c)
    (craves b a)
    (craves d b)

    ;; global state
    (harmony)

    ;; initial planet/province facts
    (planet c)
    (province d)
  )

  (:goal (and
    (craves b c)
    (craves c d)
  ))
)