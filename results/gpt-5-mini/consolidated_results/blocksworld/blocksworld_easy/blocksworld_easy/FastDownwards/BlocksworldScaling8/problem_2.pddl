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

    ;; Clearance: yellow is clear (nothing on it), blue and orange are clear.
    ;; red is not clear because yellow is on it.
    (clear yellow)
    (clear blue)
    (clear orange)

    ;; Hand state
    (handempty)

    ;; Stage progression (discrete time). A single action may be applied per stage,
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