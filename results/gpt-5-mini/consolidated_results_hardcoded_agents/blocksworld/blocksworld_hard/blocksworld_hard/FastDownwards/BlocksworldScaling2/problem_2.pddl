(define (problem BlocksworldScaling2-problem)
  (:domain blocksworld-scaling2)
  (:objects
    red orange blue yellow - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 - stage
  )
  (:init
    ;; Initial stacking configuration
    (on red orange)
    (on orange blue)
    (on yellow red)
    (ontable blue)

    ;; Explicitly stated initial facts
    (clear yellow)
    (handempty)

    ;; Initial phase/stage
    (phase s0)

    ;; Successor relation between stages enforces contiguous progression.
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
    (next s10 s11)
  )
  ;; Goal requires the two on-relations and that the plan progressed to the designated final stage.
  (:goal (and
           (on red blue)
           (on yellow orange)
           (phase s11)))
)