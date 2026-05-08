(define (problem blocks-unstacker-problem)
  (:domain blocks-multiagent)
  (:objects
    orange yellow red blue - block
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 - stage
  )
  (:init
    ;; single-hand initial condition
    (hand-empty)

    ;; table and stack initial configuration
    (on-table orange)
    (on-table blue)
    (on yellow red)
    (on red blue)

    ;; clear-status initial facts (consistent with the stacks above)
    (clear orange)
    (clear yellow)

    ;; stage objects and ordering (explicit successor chain)
    (stage stage0) (stage stage1) (stage stage2) (stage stage3) (stage stage4)
    (stage stage5) (stage stage6) (stage stage7) (stage stage8)

    (succ stage0 stage1)
    (succ stage1 stage2)
    (succ stage2 stage3)
    (succ stage3 stage4)
    (succ stage4 stage5)
    (succ stage5 stage6)
    (succ stage6 stage7)
    (succ stage7 stage8)

    ;; start at the first stage
    (at-stage stage0)
  )
  (:goal (and
           (on red orange)
           (on orange blue)
         ))
)