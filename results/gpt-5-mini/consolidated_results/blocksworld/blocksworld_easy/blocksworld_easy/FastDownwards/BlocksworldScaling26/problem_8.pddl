(define (problem build-tower-yellow-red-blue-orange)
  (:domain blocksworld-multiagent)
  (:objects
    picker unstacker stacker auditor orchestrator - agent
    red blue orange yellow - block
    stage0 stage1 stage2 stage3 stage4 - stage
  )

  (:init
    ;; initial stacking on the table
    (on red yellow)
    (on blue orange)
    (ontable yellow)
    (ontable orange)

    ;; clear means no block on top and not being held; initial holdings are none
    (clear red)
    (clear blue)

    ;; every agent's hand is empty initially
    (hand-empty picker)
    (hand-empty unstacker)
    (hand-empty stacker)
    (hand-empty auditor)
    (hand-empty orchestrator)

    ;; explicit stage ordering and unique current stage
    (current-stage stage0)
    (next stage0 stage1)
    (next stage1 stage2)
    (next stage2 stage3)
    (next stage3 stage4)
  )

  ;; Goal requires the target stacking and that the plan reached the final stage exactly.
  (:goal (and
    (on red yellow)
    (on blue red)
    (on orange blue)
    (current-stage stage4)
  ))
)