(define (problem craving-problem)
  (:domain craving-domain)

  (:objects
    a b c d - obj
  )

  (:init
    ;; initial craves relations
    (craves b a)
    (craves d b)

    ;; global harmony present initially
    (harmony)

    ;; planets as given
    (planet a)
    (planet c)

    ;; provinces as given
    (province c)
    (province d)
  )

  (:goal (and
           (craves b d)
           (craves d c)
         ))
)