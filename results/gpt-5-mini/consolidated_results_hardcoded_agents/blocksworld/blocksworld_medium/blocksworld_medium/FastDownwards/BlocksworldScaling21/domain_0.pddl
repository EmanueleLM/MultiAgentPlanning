(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent task slot resource)

  ;; Predicates
  (:predicates
    (agent ?a - agent)
    (task ?t - task)
    (slot ?s - slot)
    (resource ?r - resource)

    ;; Agent availability per slot (an agent may or may not be available in a specific slot)
    (agent-available ?a - agent ?s - slot)

    ;; Resource availability per slot (resource free in that slot)
    (resource-free ?r - resource ?s - slot)

    ;; Which slot is allowed for which task (enforces exact scheduling)
    (allowed-slot ?t - task ?s - slot)

    ;; Which agent is allowed to perform which task (enforces assignment)
    (allowed-agent ?t - task ?a - agent)

    ;; Task completion marker
    (completed ?t - task)

    ;; Record that a resource was used by a task in a specific slot
    (using ?r - resource ?t - task ?s - slot)

    ;; Explicit slot ordering (for readability and auditing)
    (slot-next ?s1 - slot ?s2 - slot)
  )

  ;; Actions:
  ;; Each concrete task execution action is authored for the specific agent assigned to it.
  ;; Actions enforce:
  ;;  - the agent is available in the exact slot allowed for the task
  ;;  - the appropriate resource is free in that slot
  ;;  - predecessor task(s) are completed (where applicable)
  ;;  - the agent and slot assignment is the exact allowed mapping (no reordering)
  ;;
  ;; Delete effects remove availability of the agent/resource in that slot and record completion.

  ;; Orchestrator agent executes task ALPHA in slot s1 using resource resA
  (:action orch-exec-alpha
    :parameters ()
    :precondition (and
      (agent agent-orch)
      (task alpha)
      (slot s1)
      (resource resA)
      (agent-available agent-orch s1)
      (resource-free resA s1)
      (allowed-slot alpha s1)
      (allowed-agent alpha agent-orch)
      (not (completed alpha))
    )
    :effect (and
      (completed alpha)
      (not (agent-available agent-orch s1))
      (not (resource-free resA s1))
      (using resA alpha s1)
    )
  )

  ;; Worker agent executes task BETA in slot s2 using resource resA
  (:action work-exec-beta
    :parameters ()
    :precondition (and
      (agent agent-work)
      (task beta)
      (slot s2)
      (resource resA)
      (agent-available agent-work s2)
      (resource-free resA s2)
      (allowed-slot beta s2)
      (allowed-agent beta agent-work)
      ;; Enforce ordering: BETA may only run after ALPHA completed
      (completed alpha)
      (not (completed beta))
    )
    :effect (and
      (completed beta)
      (not (agent-available agent-work s2))
      (not (resource-free resA s2))
      (using resA beta s2)
    )
  )

  ;; Worker agent executes task GAMMA in slot s3 using resource resB
  (:action work-exec-gamma
    :parameters ()
    :precondition (and
      (agent agent-work)
      (task gamma)
      (slot s3)
      (resource resB)
      (agent-available agent-work s3)
      (resource-free resB s3)
      (allowed-slot gamma s3)
      (allowed-agent gamma agent-work)
      ;; Enforce ordering: GAMMA may only run after BETA completed
      (completed beta)
      (not (completed gamma))
    )
    :effect (and
      (completed gamma)
      (not (agent-available agent-work s3))
      (not (resource-free resB s3))
      (using resB gamma s3)
    )
  )
)