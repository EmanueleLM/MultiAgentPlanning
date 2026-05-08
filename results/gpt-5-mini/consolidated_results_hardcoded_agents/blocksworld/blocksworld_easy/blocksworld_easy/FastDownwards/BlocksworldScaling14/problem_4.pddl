(define (problem blocks-instance)
  (:domain blocks-orchestrator)
  (:objects
    orchestrator - agent
    red blue orange yellow - block
    stage0 stage1 stage2 stage3 stage4 - stage
  )

  (:init
    ; blocks and hand
    (clear red)
    (clear blue)
    (clear orange)
    (handempty orchestrator)

    ; initial spatial relations
    (on orange yellow)
    (on-table red)
    (on-table blue)
    (on-table yellow)

    ; stage ordering and initial agent stage
    (at-stage orchestrator stage0)
    (succ stage0 stage1)
    (succ stage1 stage2)
    (succ stage2 stage3)
    (succ stage3 stage4)
  )

  (:goal (and
           (on red blue)
           (on orange red)
           (at-stage orchestrator stage4)
         ))
)