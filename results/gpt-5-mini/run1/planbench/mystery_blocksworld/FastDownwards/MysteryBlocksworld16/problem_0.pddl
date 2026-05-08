(define (problem reconciled-multiagent-problem)
  (:domain reconciled-multiagent)

  (:objects
    ;; agents
    agent1 agent2 auditor orchestrator - agent

    ;; phases (explicit discrete timeline)
    phase1 phase2 phase3 - phase

    ;; concrete tasks (explicit, no placeholders)
    t1 t2 - task
  )

  (:init
    ;; start in phase1
    (current-phase phase1)

    ;; contiguous phase ordering (enforce sequencing and contiguity)
    (phase-next phase1 phase2)
    (phase-next phase2 phase3)

    ;; Authority / assignment facts (encoded as hard constraints)
    ;; Agent1 may create t1 only in phase1; Agent2 may create t2 only in phase1
    (can-create agent1 t1 phase1)
    (can-create agent2 t2 phase1)

    ;; Auditor may review both tasks only in phase2
    (can-review auditor t1 phase2)
    (can-review auditor t2 phase2)

    ;; Orchestrator may deploy tasks only in phase3
    (can-deploy orchestrator t1 phase3)
    (can-deploy orchestrator t2 phase3)

    ;; No task is created, reviewed, or deployed initially (explicitly absent)
  )

  (:goal (and
    ;; Mandated terminal conditions: both tasks must be deployed
    (task-deployed t1)
    (task-deployed t2)

    ;; and system must have advanced to the final phase (enforces completion ordering)
    (current-phase phase3)
  ))