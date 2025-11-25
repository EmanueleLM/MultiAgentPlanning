(define (problem blocks-orch-prob)
  (:domain blocks-orchestrated)
  (:objects
    red blue orange yellow - block
    table - support
    stage0 stage1 stage2 stage3 stage4 - stage
  )
  (:init
    ;; initial positions: all blocks on the table and clear; hand is empty
    (on red table)
    (on blue table)
    (on orange table)
    (on yellow table)

    (clear red)
    (clear blue)
    (clear orange)
    (clear yellow)

    (handempty)

    ;; mark which support is the table (static)
    (is-table table)

    ;; stage progression: start at stage0 and provide a linear successor chain to stage4
    (current stage0)
    (next stage0 stage1)
    (next stage1 stage2)
    (next stage2 stage3)
    (next stage3 stage4)
  )
  ;; goal must hold exactly at the terminal stage (enforces ordered progression)
  (:goal (and
    (on red blue)
    (on yellow red)
    (current stage4)
  ))
)