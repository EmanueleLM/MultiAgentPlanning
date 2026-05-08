(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    blue orange yellow red - block
    s0 s1 s2 s3 s4 - stage
  )

  (:init
    ;; Spatial relations
    (on yellow red)
    (ontable red)
    (ontable blue)
    (ontable orange)

    ;; Clearance: a block is clear if nothing is on top of it and it is not held.
    (clear yellow)
    (clear blue)
    (clear orange)
    ;; red is not listed as clear because yellow is on it.

    ;; Hand state
    (handempty)

    ;; Stage progression (discrete time). Exactly one action may be applied per stage,
    ;; which must advance the current stage along the provided next chain.
    (current s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
  )

  (:goal
    (and
      (on blue yellow)
      (on yellow red)
    )
  )
)