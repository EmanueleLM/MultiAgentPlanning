(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    blue orange yellow red - block
    s0 s1 s2 s3 s4 - stage
  )

  (:init
    ;; spatial relations
    (on yellow red)
    (ontable red)
    (ontable blue)
    (ontable orange)

    ;; clearance: true iff no block on top and not being held
    (clear yellow)
    (clear blue)
    (clear orange)
    ;; red is not clear initially because yellow is on it

    ;; hand state
    (handempty)

    ;; stage progression and current stage
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