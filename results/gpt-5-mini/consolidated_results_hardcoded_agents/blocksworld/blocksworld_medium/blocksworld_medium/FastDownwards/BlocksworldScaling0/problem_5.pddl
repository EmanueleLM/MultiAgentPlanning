(define (problem stack-three-blocks)
  (:domain blocks-multiagent)

  (:objects
    block_player temporal_auditor orchestrator - agent

    red yellow blue orange - block

    phase1 phase2 - phase
  )

  (:init
    ;; agent roles
    (is-block-player block_player)
    (is-temporal-auditor temporal_auditor)
    (is-orchestrator orchestrator)

    ;; hands start empty
    (handempty block_player)
    (handempty temporal_auditor)
    (handempty orchestrator)

    ;; initial block configuration
    (on red yellow)
    (on blue orange)
    (ontable orange)
    (ontable yellow)

    ;; clear blocks: nothing on top of them (and they are not held initially)
    (clear red)
    (clear blue)

    ;; phase control: start in phase1, define ordering to phase2
    (current phase1)
    (next phase1 phase2)
  )

  (:goal (and
    (on blue yellow)
    (on yellow red)
  ))
)