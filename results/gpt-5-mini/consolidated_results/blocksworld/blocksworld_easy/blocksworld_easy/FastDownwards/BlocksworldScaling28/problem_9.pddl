(define (problem blocks-orch-prob)
  (:domain blocks-orchestrated)
  (:objects
    red blue orange yellow - block
    table - support
    stage0 stage1 stage2 stage3 stage4 - stage
  )
  (:init
    ;; all blocks initially on the table and clear
    (on red table)
    (on blue table)
    (on orange table)
    (on yellow table)

    (clear red)
    (clear blue)
    (clear orange)
    (clear yellow)

    (handempty)
    (is-table table)

    ;; initial stage and immediate successor chain (enforces contiguous progression)
    (current stage0)
    (next stage0 stage1)
    (next stage1 stage2)
    (next stage2 stage3)
    (next stage3 stage4)
  )
  (:goal (and
    (on red blue)
    (on yellow red)
    (current stage4)
  ))
)