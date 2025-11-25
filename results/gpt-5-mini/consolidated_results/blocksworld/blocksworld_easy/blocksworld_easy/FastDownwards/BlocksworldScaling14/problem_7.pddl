(define (problem blocks-instance)
  (:domain blocks-orchestrator)
  (:objects
    orchestrator - agent
    red blue orange yellow - block
    stage0 stage1 stage2 stage3 stage4 - stage
  )

  (:init
    ;; Initial clear and hand state (clear true means no blocks on top and not held)
    (clear red)
    (clear blue)
    (clear orange)
    (handempty orchestrator)

    ;; Initial positions
    (on orange yellow)
    (on-table red)
    (on-table blue)
    (on-table yellow)

    ;; Stage/time ordering and initial agent stage
    (at-stage orchestrator stage0)
    (succ stage0 stage1)
    (succ stage1 stage2)
    (succ stage2 stage3)
    (succ stage3 stage4)
  )

  ;; Goal: red on blue and orange on red simultaneously
  (:goal (and
           (on red blue)
           (on orange red)
         ))
)