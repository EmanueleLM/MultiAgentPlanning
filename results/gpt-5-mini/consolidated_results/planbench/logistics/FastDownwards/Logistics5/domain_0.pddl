(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent task step)

  (:predicates
    ;; Roles
    (role-orchestrator ?a - agent)
    (role-planner ?a - agent)
    (role-worker ?a - agent)
    (role-auditor ?a - agent)

    ;; Capabilities: which agent can perform which task
    (agent-capable ?a - agent ?t - task)

    ;; Task-step linkage and step ordering
    (task-step ?t - task ?s - step)
    (step-next ?s - step ?next - step)

    ;; Step and task status
    (step-ready ?s - step)
    (step-done ?s - step)
    (task-assigned ?t - task ?a - agent)
    (task-done ?t - task)

    ;; Final audit outcome
    (audit-done)
  )

  ;; The orchestrator assigns a ready task's agent. Assignment is permanent.
  (:action assign-by-orchestrator
    :parameters (?orch - agent ?task - task ?ag - agent ?step - step)
    :precondition (and
      (role-orchestrator ?orch)
      (task-step ?task ?step)
      (step-ready ?step)
      (agent-capable ?ag ?task)
      (not (task-assigned ?task ?ag))
    )
    :effect (and
      (task-assigned ?task ?ag)
    )
  )

  ;; Planner performs a task assigned to them when the task's step is ready.
  ;; This action marks the task and its step done and makes the next step ready.
  (:action perform-by-planner
    :parameters (?planner - agent ?task - task ?step - step ?next - step)
    :precondition (and
      (role-planner ?planner)
      (task-step ?task ?step)
      (step-ready ?step)
      (task-assigned ?task ?planner)
      (step-next ?step ?next)
      (not (step-done ?step))
      (not (task-done ?task))
    )
    :effect (and
      (task-done ?task)
      (step-done ?step)
      (not (step-ready ?step))
      (step-ready ?next)
    )
  )

  ;; Worker performs a task assigned to them when the task's step is ready.
  ;; Behavioral semantics identical to planner's perform action but distinct schema.
  (:action perform-by-worker
    :parameters (?worker - agent ?task - task ?step - step ?next - step)
    :precondition (and
      (role-worker ?worker)
      (task-step ?task ?step)
      (step-ready ?step)
      (task-assigned ?task ?worker)
      (step-next ?step ?next)
      (not (step-done ?step))
      (not (task-done ?task))
    )
    :effect (and
      (task-done ?task)
      (step-done ?step)
      (not (step-ready ?step))
      (step-ready ?next)
    )
  )

  ;; Auditor performs the audit once the ordered sequence of steps reaches the terminal sentinel.
  ;; Requiring step-ready on the terminal sentinel enforces that all prior steps (and thus tasks) were completed in order.
  (:action audit-by-auditor
    :parameters (?aud - agent ?terminal - step)
    :precondition (and
      (role-auditor ?aud)
      (step-ready ?terminal)
      (not (audit-done))
    )
    :effect (and
      (audit-done)
    )
  )
)