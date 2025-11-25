(define (problem blocks-unstacker-problem)
  (:domain blocks-multiagent)
  (:objects
    orange yellow red blue - block
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 - stage
  )
  (:init
    (hand-empty)

    (on-table orange)
    (on-table blue)
    (on yellow red)
    (on red blue)

    (clear orange)
    (clear yellow)

    (succ stage0 stage1)
    (succ stage1 stage2)
    (succ stage2 stage3)
    (succ stage3 stage4)
    (succ stage4 stage5)
    (succ stage5 stage6)
    (succ stage6 stage7)
    (succ stage7 stage8)

    (at-stage stage0)
  )
  (:goal (and
           (on red orange)
           (on orange blue)
           (at-stage stage8)
         )))