(define (problem crave-instance)
  (:domain social-interactions)
  (:objects
    a b d - agent
  )
  (:init
    (alive a)
    (alive b)
    (alive d)
    ;; No attacked/succumbed/overcame/feasted/craves facts initially.
    ;; The plan must produce (craves a d) and (craves d b) via Attack+Succumb sequences.
  )
  (:goal (and
    (craves a d)
    (craves d b)
  ))
)