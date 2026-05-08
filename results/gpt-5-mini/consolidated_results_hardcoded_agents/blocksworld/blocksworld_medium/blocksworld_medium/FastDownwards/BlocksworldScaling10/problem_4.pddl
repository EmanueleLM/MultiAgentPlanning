(define (problem blocksworld-scaling10-problem)
  (:domain blocksworld-scaling10-domain)
  (:objects
    red blue yellow orange - block
    s0 s1 s2 s3 s4 s5 s6 - stage
  )
  (:init
    ;; initial stacking: red on blue, blue on yellow, yellow on orange, orange on table
    (on red blue)
    (on blue yellow)
    (on yellow orange)
    (ontable orange)

    ;; only the topmost block indicated as clear in the human description
    (clear red)

    ;; hand initially empty
    (handempty)

    ;; explicit stage/token-based time progression (discrete stages)
    (at-stage s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
  )

  ;; Goal: have yellow on top of red (must hold at end of plan)
  (:goal (and (on yellow red)))
)