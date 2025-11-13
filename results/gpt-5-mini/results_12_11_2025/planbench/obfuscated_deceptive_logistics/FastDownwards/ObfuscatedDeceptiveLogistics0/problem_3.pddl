(define (problem orchestrator_problem)
  (:domain orchestrator_domain)
  (:objects
    object_1 object_6 object_7 object_8 - obj
    s0 s1 s2 s3 - step
  )

  (:init
    ;; Minimal initial facts required to support the reachable plan to the goal
    (cats object_1)
    (hand object_8)
    (texture object_6)
    (texture object_7)
    (spring object_6)
    (spring object_7)

    (next object_1 object_7)
    (next object_8 object_7)

    ;; compact stage chain sufficient for three actions
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (current s0)
  )

  (:goal (and
    (next object_8 object_6)
  ))
)