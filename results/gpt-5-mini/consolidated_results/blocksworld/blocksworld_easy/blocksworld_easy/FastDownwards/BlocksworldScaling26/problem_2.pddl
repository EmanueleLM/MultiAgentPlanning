(define (problem build-tower-yellow-red-blue-orange)
  (:domain blocksworld-multiagent)
  (:objects
    picker unstacker stacker auditor orchestrator - agent
    red blue orange yellow - block
    stage0 stage1 stage2 stage3 stage4 - stage
  )

  (:init
    ;; initial stacking and table facts
    (on red yellow)
    (on blue orange)
    (ontable yellow)
    (ontable orange)

    ;; clear predicates: top blocks are clear; bottom blocks are not listed as clear
    (clear red)
    (clear blue)

    ;; all agents start with empty hands
    (hand-empty picker)
    (hand-empty unstacker)
    (hand-empty stacker)
    (hand-empty auditor)
    (hand-empty orchestrator)

    ;; stage ordering and initial stage token (enforces sequential, discrete steps)
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