(define (problem crave-c-a)
  (:domain craving-domain)
  (:objects
    a b c d - obj
    s0 s1 s2 s3 - stage
  )
  (:init
    ;; initial craving relations
    (craves a b)
    (craves d c)

    ;; initial global facts
    (harmony)
    (planet b)
    (planet c)
    (province a)
    (province d)

    ;; stage ordering and initial current stage
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (curr s0)
  )
  (:goal (craves c a))
)