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

    ;; Clearance: true iff no block on top and not being held
    (clear yellow)
    (clear blue)
    (clear orange)
    ;; red is not clear initially because yellow is on it

    ;; Hand state
    (handempty)

    ;; Stage progression: single current stage and explicit successor chain.
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