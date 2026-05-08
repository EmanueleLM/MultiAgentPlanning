(define (problem blocksworld_scaling0-problem)
  (:domain blocksworld_scaling0)
  (:objects
    blue orange yellow red - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - step
  )
  (:init
    ;; initial stack: blue on orange on yellow on red on table
    (on blue orange)
    (on orange yellow)
    (on yellow red)
    (ontable red)

    ;; clear status and hand
    (clear blue)
    (handempty)

    ;; explicit linear time steps to enforce one-action-per-step and contiguous progression
    (current s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
    (next s6 s7)
    (next s7 s8)
    (next s8 s9)
    (next s9 s10)
  )
  (:goal (and
    (on red orange)
    (on yellow red)
  ))
)