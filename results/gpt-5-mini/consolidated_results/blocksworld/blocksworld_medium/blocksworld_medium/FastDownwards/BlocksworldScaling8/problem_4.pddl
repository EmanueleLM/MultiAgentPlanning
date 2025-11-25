(define (problem place-red-on-blue)
  (:domain block-orchestration)
  (:objects
    red blue orange yellow - block
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 - stage
  )

  (:init
    ;; Initial stacking as provided
    (on red yellow)
    (on blue red)
    (on orange blue)
    (ontable yellow)

    ;; Only orange is initially clear (top of the tower)
    (clear orange)

    ;; Hand is initially empty
    (handempty)

    ;; Discrete stage progression and start stage (explicit successor chain)
    (current-stage stage0)
    (succ stage0 stage1)
    (succ stage1 stage2)
    (succ stage2 stage3)
    (succ stage3 stage4)
    (succ stage4 stage5)
    (succ stage5 stage6)
  )

  (:goal (and
           (on red blue)
         ))
)