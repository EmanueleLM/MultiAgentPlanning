(define (problem blocks-instance)
  (:domain blocks-orchestrator)
  (:objects
    orchestrator - agent
    red blue orange yellow - block
    stage0 stage1 stage2 stage3 stage4 - stage
  )

  ;; Initial facts:
  ;; red clear, blue clear, orange clear, hand empty,
  ;; orange on yellow, red on table, blue on table, yellow on table
  ;; Agent starts at stage0. Succession of stages enforces ordering of actions.
  (:init
    (clear red)
    (clear blue)
    (clear orange)
    (handempty orchestrator)
    (on orange yellow)
    (on-table red)
    (on-table blue)
    (on-table yellow)
    (at-stage orchestrator stage0)
    (succ stage0 stage1)
    (succ stage1 stage2)
    (succ stage2 stage3)
    (succ stage3 stage4)
  )

  ;; Goal: red on blue and orange on red achieved at final stage4.
  (:goal (and
           (on red blue)
           (on orange red)
           (at-stage orchestrator stage4)
         ))
)