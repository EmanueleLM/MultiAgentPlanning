(define (problem build-tower-yellow-red-blue-orange)
  (:domain blocksworld-multiagent)
  (:objects
    picker unstacker stacker auditor orchestrator - agent
    red blue orange yellow - block
    stage0 stage1 stage2 stage3 stage4 - stage
  )

  (:init
    (on red yellow)
    (on blue orange)
    (ontable yellow)
    (ontable orange)
    (clear red)
    (clear blue)
    (hand-empty picker)
    (hand-empty unstacker)
    (hand-empty stacker)
    (hand-empty auditor)
    (hand-empty orchestrator)
    (current-stage stage0)
    (next stage0 stage1)
    (next stage1 stage2)
    (next stage2 stage3)
    (next stage3 stage4)
  )

  (:goal (and
    (on red yellow)
    (on blue red)
    (on orange blue)
  ))
)