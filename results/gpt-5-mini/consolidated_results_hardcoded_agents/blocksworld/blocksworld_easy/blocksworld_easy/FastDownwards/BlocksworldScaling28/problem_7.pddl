(define (problem blocks-orch-prob)
  (:domain blocks-orchestrated)
  (:objects
    ;; blocks are declared; block is a subtype of support as in the domain.
    red blue orange yellow - block
    ;; table is a support (not a block)
    table - support
    ;; discrete stages to enforce ordered, contiguous progression. The number of stages
    ;; must be sufficient for any valid plan to reach the goal; we include 5 stages here.
    stage0 stage1 stage2 stage3 stage4 - stage
  )
  (:init
    ;; All blocks start on the table and are clear.
    (on red table)
    (on blue table)
    (on orange table)
    (on yellow table)

    (clear red)
    (clear blue)
    (clear orange)
    (clear yellow)

    ;; Hand initially empty.
    (handempty)

    ;; Identify the table support.
    (is-table table)

    ;; Initial stage and stage successor chain ensure strict, contiguous progression.
    (current stage0)
    (next stage0 stage1)
    (next stage1 stage2)
    (next stage2 stage3)
    (next stage3 stage4)
  )
  (:goal (and
    ;; Terminal conditions: red on blue, yellow on red, and the system must have advanced to final stage.
    (on red blue)
    (on yellow red)
    (current stage4)
  ))
)