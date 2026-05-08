(define (problem craving-problem)
  (:domain craving-domain)

  (:objects
    a b c d - obj
  )

  (:init
    ; initial craves
    (craves b a)
    (craves d b)

    ; auxiliary markers consistent with craves facts
    (has-crave b)
    (has-crave d)

    ; global flags
    (harmony)
    (no-pain)

    ; planets and provinces as given
    (planet a)
    (planet c)

    (province c)
    (province d)
  )

  (:goal (and
           (craves b d)
           (craves d c)
         ))
)