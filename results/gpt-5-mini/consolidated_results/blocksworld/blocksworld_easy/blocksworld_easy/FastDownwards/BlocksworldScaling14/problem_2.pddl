(define (problem blocks-instance)
  (:domain blocks-orchestrator)
  (:objects
    orchestrator - agent
    red blue orange yellow - block
    stage0 stage1 stage2 stage3 stage4 - stage
  )

  (:init
    ;; clear facts: red, blue, orange are clear (no block on them and not held)
    (clear red)
    (clear blue)
    (clear orange)

    ;; hand is empty
    (handempty orchestrator)

    ;; initial stacking: orange is on yellow; red, blue, yellow are on the table
    (on orange yellow)
    (on-table red)
    (on-table blue)
    (on-table yellow)

    ;; agent stage token and explicit stage succession (enforces contiguous stage progression)
    (at-stage orchestrator stage0)
    (succ stage0 stage1)
    (succ stage1 stage2)
    (succ stage2 stage3)
    (succ stage3 stage4)
  )

  ;; Goal requires both block configuration and that the orchestrator reached the final stage.
  (:goal (and
           (on red blue)
           (on orange red)
           (at-stage orchestrator stage4)
         ))
)