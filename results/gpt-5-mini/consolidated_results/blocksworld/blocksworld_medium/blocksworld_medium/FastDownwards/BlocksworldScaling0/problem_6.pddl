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

    ;; hand states
    (handempty block_player)

    ;; initial block configuration
    (on red yellow)
    (on blue orange)
    (ontable orange)
    (ontable yellow)

    ;; clear blocks (no block on top and not held)
    (clear red)
    (clear blue)

    ;; phase control and ordering
    (current phase1)
    (next phase1 phase2)

    ;; specify the subgoal required to advance from phase1 to phase2:
    ;; phase1 requires that yellow be on red before advancing.
    (requires-on phase1 yellow red)
  )

  (:goal (and
    (on blue yellow)
    (on yellow red)
  ))
)