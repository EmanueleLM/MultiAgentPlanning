(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    ;; Agents
    agent-orch agent-work - agent

    ;; Tasks
    alpha beta gamma - task

    ;; Slots (explicit discrete timeline)
    s1 s2 s3 - slot

    ;; Resources
    resA resB - resource
  )

  (:init
    ;; Type facts (helpful explicit markers)
    (agent agent-orch)
    (agent agent-work)

    (task alpha)
    (task beta)
    (task gamma)

    (slot s1)
    (slot s2)
    (slot s3)

    (resource resA)
    (resource resB)

    ;; Slot ordering (explicit successor links; enforces contiguity in audits/verification)
    (slot-next s1 s2)
    (slot-next s2 s3)

    ;; Allowed slot mapping (enforce that each task must be performed in the specified slot)
    ;; The auditor required exact slots for ordered phases; we encode them as hard constraints.
    (allowed-slot alpha s1)
    (allowed-slot beta s2)
    (allowed-slot gamma s3)

    ;; Allowed agent mapping (enforce which agent must perform which task)
    (allowed-agent alpha agent-orch)
    (allowed-agent beta agent-work)
    (allowed-agent gamma agent-work)

    ;; Agents are initially available in all slots (availability is consumed when task runs)
    (agent-available agent-orch s1)
    (agent-available agent-orch s2)
    (agent-available agent-orch s3)

    (agent-available agent-work s1)
    (agent-available agent-work s2)
    (agent-available agent-work s3)

    ;; Resources are free in each slot initially.
    ;; Because resources are represented per-slot, using a resource in one slot does not automatically
    ;; free it or occupy it in other slots — this models discrete-time resource occupation.
    (resource-free resA s1)
    (resource-free resA s2)
    (resource-free resA s3)

    (resource-free resB s1)
    (resource-free resB s2)
    (resource-free resB s3)

    ;; Initially, no tasks are completed (so no (completed ...) facts)
  )

  ;; Hard goal: all tasks must be completed in their mandated slots and by their mandated agents.
  ;; This enforces the terminal conditions directly and prevents any partial / penalty-based solutions.
  (:goal (and
    (completed alpha)
    (completed beta)
    (completed gamma)
  ))
)