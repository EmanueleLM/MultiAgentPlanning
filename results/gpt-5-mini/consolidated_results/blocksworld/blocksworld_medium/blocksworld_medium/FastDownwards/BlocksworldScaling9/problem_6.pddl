(define (problem bw-orchestrated-problem-1)
  (:domain blocksworld-orchestrated)

  (:objects
    red blue orange yellow - block
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 - stage
  )

  (:init
    ;; placement
    (on red yellow)
    (ontable yellow)
    (ontable blue)
    (ontable orange)

    ;; clear facts consistent with placement: red is clear, yellow is not listed as clear.
    (clear red)
    (clear blue)
    (clear orange)

    ;; single-hand initial state
    (handempty)

    ;; stage chain and initial current stage
    (stage stage0)
    (next stage0 stage1)
    (next stage1 stage2)
    (next stage2 stage3)
    (next stage3 stage4)
    (next stage4 stage5)
    (next stage5 stage6)
  )

  (:goal (and
    (on red blue)
    (on blue yellow)
    (stage stage6)
  ))
)