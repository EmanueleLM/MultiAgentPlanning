(define (problem provinces-problem)
  (:domain provinces-domain)

  (:objects
    a b c d - object
  )

  (:init
    ;; initial craving relations
    (craves c a)
    (craves d c)

    ;; initial global state
    (harmony)

    ;; planets
    (planet a)
    (planet b)

    ;; provinces
    (province b)
    (province d)
  )

  (:goal (and
    (craves b c)
    (craves d a)
  ))
)