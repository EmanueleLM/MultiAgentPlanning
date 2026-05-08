(define (problem multi-agent-workflow-problem)
  (:domain multi-agent-workflow)

  (:objects
    ;; agents
    orchestrator auditor executor - agent

    ;; explicit phases to enforce ordering; p5 is terminal "done" phase
    p1 p2 p3 p4 p5 - phase

    ;; workflow steps (one-to-one with the first four phases)
    s_assess s_prepare s_execute s_verify - step

    ;; single result produced by execution
    r1 - result
  )

  (:init
    ;; current phase starts at p1 (assess)
    (current-phase p1)

    ;; phase succession chain to enforce contiguity
    (successor p1 p2)
    (successor p2 p3)
    (successor p3 p4)
    (successor p4 p5)

    ;; bind each step to its phase (explicit mapping)
    (step-of s_assess p1)
    (step-of s_prepare p2)
    (step-of s_execute p3)
    (step-of s_verify p4)

    ;; assign steps to agents (hard constraints)
    (assigned s_assess orchestrator)
    (assigned s_prepare orchestrator)
    (assigned s_execute executor)
    (assigned s_verify auditor)

    ;; No steps completed and no result generated initially.
    ;; (completed ...) and (result-generated ...) and (verified ...) are absent initially.
  )

  (:goal
    (and
      ;; all steps must be completed
      (completed s_assess)
      (completed s_prepare)
      (completed s_execute)
      (completed s_verify)

      ;; the execution must have produced the explicit result and it must be verified
      (result-generated r1)
      (verified r1)

      ;; terminal phase must be reached (ensures advancement through all phases)
      (current-phase p5)
    )
  )
)