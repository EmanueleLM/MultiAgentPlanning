(define (problem stack-three-blocks)
  (:domain blocks-multiagent)

  (:objects
    block_player temporal_auditor orchestrator - agent

    red yellow blue orange - block

    phase1 phase2 - phase
  )

  (:init
    ;; agent identity markers
    (is-block-player block_player)
    (is-temporal-auditor temporal_auditor)
    (is-orchestrator orchestrator)

    ;; all agents start with empty hands (no one is holding any block)
    (handempty block_player)
    (handempty temporal_auditor)
    (handempty orchestrator)

    ;; initial block configuration:
    (on red yellow)
    (on blue orange)
    (ontable orange)
    (ontable yellow)

    ;; clear blocks (those with nothing on top and not held)
    (clear red)
    (clear blue)
    ;; yellow and orange are not clear because red and blue are on them respectively

    ;; phase sequencing and markers
    (current phase1)
    (next phase1 phase2)
    (is-phase1 phase1)
    (is-phase2 phase2)
  )

  (:goal (and
    (on blue yellow)
    (on yellow red)
  ))
)