(define (problem BlocksworldScaling12-problem)
  (:domain blocks-multi)
  (:objects
    red orange blue yellow - block
    a1 - agent
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 - stage
  )
  ;; Initial state:
  ;; - The hand of agent a1 is empty.
  ;; - The tower from table upward is: yellow (on table) <- blue <- orange <- red (top).
  ;; - Only red is clear initially (it has no block on top).
  ;; - Stage/time starts at stage0 and successor links are explicit.
  (:init
    (handempty a1)
    (ontable yellow)
    (on blue yellow)
    (on orange blue)
    (on red orange)
    (clear red)

    ;; stage sequencing (explicit discrete time progression)
    (current stage0)
    (succ stage0 stage1)
    (succ stage1 stage2)
    (succ stage2 stage3)
    (succ stage3 stage4)
    (succ stage4 stage5)
    (succ stage5 stage6)
    (succ stage6 stage7)
    (succ stage7 stage8)
  )

  ;; Goal state: exactly the required on relations (no extra goal bookkeeping).
  ;; - blue on top of yellow
  ;; - orange on top of red
  ;; - yellow on top of orange
  (:goal
    (and
      (on blue yellow)
      (on orange red)
      (on yellow orange)
    )
  )
)