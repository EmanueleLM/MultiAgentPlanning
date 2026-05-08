(define (domain reconciled-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent phase task)

  (:predicates
    ;; phase control
    (current-phase ?p - phase)
    (phase-next ?p ?q - phase)

    ;; task lifecycle
    (task-created ?t - task)
    (task-reviewed ?t - task)
    (task-deployed ?t - task)

    ;; authority/permission facts (instantiated in the problem)
    (can-create ?a - agent ?t - task ?p - phase)
    (can-review ?a - agent ?t - task ?p - phase)
    (can-deploy ?a - agent ?t - task ?p - phase)
  )

  ;; Actions are namespaced by agent name as required.
  ;; Creation actions (must happen in phase1 and only if permitted and task not yet created)
  (:action agent1-create
    :parameters (?t - task ?p - phase)
    :precondition (and
      (current-phase ?p)
      (can-create agent1 ?t ?p)
      (not (task-created ?t))
    )
    :effect (task-created ?t)
  )

  (:action agent2-create
    :parameters (?t - task ?p - phase)
    :precondition (and
      (current-phase ?p)
      (can-create agent2 ?t ?p)
      (not (task-created ?t))
    )
    :effect (task-created ?t)
  )

  ;; Review actions by auditor (must happen in phase2, task must have been created)
  (:action auditor-review
    :parameters (?t - task ?p - phase)
    :precondition (and
      (current-phase ?p)
      (can-review auditor ?t ?p)
      (task-created ?t)
      (not (task-reviewed ?t))
    )
    :effect (task-reviewed ?t)
  )

  ;; Phase advancement actions are explicit and enforce required completed facts.
  ;; These actions are namespaced to the orchestrator.
  ;; Advance from phase1 to phase2 requires both tasks to be created.
  (:action orchestrator-advance-p1-p2
    :parameters ()
    :precondition (and
      (current-phase phase1)
      (phase-next phase1 phase2)
      (task-created t1)
      (task-created t2)
      (not (current-phase phase2))
    )
    :effect (and
      (not (current-phase phase1))
      (current-phase phase2)
    )
  )

  ;; Advance from phase2 to phase3 requires both tasks to be reviewed.
  (:action orchestrator-advance-p2-p3
    :parameters ()
    :precondition (and
      (current-phase phase2)
      (phase-next phase2 phase3)
      (task-reviewed t1)
      (task-reviewed t2)
      (not (current-phase phase3))
    )
    :effect (and
      (not (current-phase phase2))
      (current-phase phase3)
    )
  )

  ;; Deployment actions (must happen in phase3 and only if permitted and task reviewed)
  (:action orchestrator-deploy-t1
    :parameters (?p - phase)
    :precondition (and
      (current-phase ?p)
      (can-deploy orchestrator t1 ?p)
      (task-reviewed t1)
      (not (task-deployed t1))
    )
    :effect (task-deployed t1)
  )

  (:action orchestrator-deploy-t2
    :parameters (?p - phase)
    :precondition (and
      (current-phase ?p)
      (can-deploy orchestrator t2 ?p)
      (task-reviewed t2)
      (not (task-deployed t2))
    )
    :effect (task-deployed t2)
  )

)