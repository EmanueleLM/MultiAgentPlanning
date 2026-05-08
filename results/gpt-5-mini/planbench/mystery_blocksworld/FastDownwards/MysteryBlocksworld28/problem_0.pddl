(define (problem craving-transfer-problem)
  (:domain craving-transfer)
  (:objects a b c d - obj)
  (:init
    ;; initial craves facts
    (craves b a)
    (craves d b)
    ;; initial global harmony
    (harmony)
    ;; initial planets
    (planet a)
    (planet c)
    ;; initial provinces
    (province c)
    (province d)
  )
  (:goal (and
    (craves b d)
    (craves d c)
  ))
)