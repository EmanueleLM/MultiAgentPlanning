(define (problem orchestrator-problem)
  (:domain orchestrator)
  (:objects
    agent_a1 agent_a2 - agent
    prepare verify deploy - task
  )

  (:init
    ; Agents and tasks
    (agent agent_a1)
    (agent agent_a2)
    (task prepare)
    (task verify)
    (task deploy)

    ; Capability facts (do not invent capabilities beyond these provided)
    (can-do agent_a1 prepare)
    (can-do agent_a1 deploy)
    (can-do agent_a2 verify)

    ; Explicit dependency report facts (normalized). These reflect the required ordering:
    ; prepare -> verify -> deploy
    (before prepare verify)
    (before verify deploy)

    ; No tasks are done or audited at the start.
    ; (The absence of (done ...) and (audited ...) enforces that these must be produced by the actions.)
  )

  ; Goals require that each mandated terminal condition is satisfied.
  ; This includes completion of all tasks and the audit condition for "verify".
  (:goal (and
    (done prepare)
    (done verify)
    (done deploy)
    (audited verify)
    ; Record of which agent performed each task must exist as part of final state per audit constraints:
    (done-by prepare agent_a1)
    (done-by verify agent_a2)
    (done-by deploy agent_a1)
  ))
)