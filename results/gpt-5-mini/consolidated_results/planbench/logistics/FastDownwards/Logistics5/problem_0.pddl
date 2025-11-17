(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    ;; Agents
    orchestrator - agent
    plannerA - agent
    worker1 - agent
    worker2 - agent
    auditor - agent

    ;; Tasks
    t1 t2 t3 - task

    ;; Steps: s_end is a terminal sentinel step used to enforce ordered completion.
    s1 s2 s3 s_end - step
  )

  (:init
    ;; Roles
    (role-orchestrator orchestrator)
    (role-planner plannerA)
    (role-worker worker1)
    (role-worker worker2)
    (role-auditor auditor)

    ;; Capabilities (strict constraints: only these agents may be assigned these tasks)
    (agent-capable plannerA t1)
    (agent-capable worker1 t2)
    (agent-capable worker2 t3)

    ;; One-to-one mapping of tasks to ordered steps
    (task-step t1 s1)
    (task-step t2 s2)
    (task-step t3 s3)

    ;; Explicit step successor chain to enforce strict ordering: s1 -> s2 -> s3 -> s_end
    (step-next s1 s2)
    (step-next s2 s3)
    (step-next s3 s_end)

    ;; Initially only the first step is ready; no tasks are assigned or done.
    (step-ready s1)

    ;; No task-assigned, no task-done, no step-done, and audit not done are the implicit default.
    ;; (These facts are absent; PDDL interprets them as false.)
  )

  ;; The goal requires every task completed and the final audit completed.
  ;; Also the sequence semantics encoded by step-next ensures correct ordering; the audit requires the terminal sentinel ready.
  (:goal (and
    (task-done t1)
    (task-done t2)
    (task-done t3)
    (audit-done)
  ))