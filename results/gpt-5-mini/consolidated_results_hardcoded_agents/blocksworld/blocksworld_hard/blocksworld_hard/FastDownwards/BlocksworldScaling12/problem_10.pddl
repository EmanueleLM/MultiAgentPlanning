(define (problem BlocksworldScaling12-problem)
  (:domain blocks-multi)
  (:objects
    red orange blue yellow - block
    a1 - agent
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9 stage10 - stage
  )
  (:init
    ;; single agent's hand empty initially
    (handempty a1)

    ;; initial block configuration (a single stack: red on orange on blue on yellow on table)
    (ontable yellow)
    (on blue yellow)
    (on orange blue)
    (on red orange)
    (clear red)

    ;; stage sequencing: actions must consume and advance the current stage
    (current stage0)
    (succ stage0 stage1)
    (succ stage1 stage2)
    (succ stage2 stage3)
    (succ stage3 stage4)
    (succ stage4 stage5)
    (succ stage5 stage6)
    (succ stage6 stage7)
    (succ stage7 stage8)
    (succ stage8 stage9)
    (succ stage9 stage10)
  )
  (:goal
    (and
      (on blue yellow)
      (on orange red)
      (on yellow orange)
    )
  )
)