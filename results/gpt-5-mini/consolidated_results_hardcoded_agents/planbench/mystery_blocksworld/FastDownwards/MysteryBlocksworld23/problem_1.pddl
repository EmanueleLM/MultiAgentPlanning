(define (problem mysteryblocksworld23-prob)
  (:domain mysteryblocksworld23)

  (:objects
    a b c d - obj
  )

  (:init
    ; initial cravings
    (craves b a)
    (craves d b)

    ; initial global phase and object types
    (harmony)

    (planet a)
    (planet c)

    (province c)
    (province d)
  )

  (:goal (and
           (craves b d)
         ))
)