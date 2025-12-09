(define (domain multi-agent-workflow)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent phase step result)

  (:predicates
    ;; which phase is currently active (exactly one maintained by actions)
    (current-phase ?p - phase)

    ;; explicit phase ordering (used for actions to advance the phase)
    (successor ?p1 - phase ?p2 - phase)

    ;; which agent is assigned to which step (fixed in the problem)
    (assigned ?s - step ?a - agent)

    ;; which step belongs to which phase (fixed in the problem)
    (step-of ?s - step ?p - phase)

    ;; completion flags for steps
    (completed ?s - step)

    ;; produce / verify result
    (result-generated ?r - result)
    (verified ?r - result)
  )

  ;; Orchestrator performs the "assess" step; completing it advances phase.
  (:action orchestrator-assess
    :parameters (?a - agent ?s - step ?p - phase ?pnext - phase)
    :precondition (and
      (assigned ?s ?a)
      (step-of ?s ?p)
      (current-phase ?p)
      (successor ?p ?pnext)
      (not (completed ?s))
    )
    :effect (and
      (completed ?s)
      (not (current-phase ?p))
      (current-phase ?pnext)
    )
  )

  ;; Orchestrator performs the "prepare" step; completing it advances phase.
  (:action orchestrator-prepare
    :parameters (?a - agent ?s - step ?p - phase ?pnext - phase)
    :precondition (and
      (assigned ?s ?a)
      (step-of ?s ?p)
      (current-phase ?p)
      (successor ?p ?pnext)
      (not (completed ?s))
    )
    :effect (and
      (completed ?s)
      (not (current-phase ?p))
      (current-phase ?pnext)
    )
  )

  ;; Executor performs the "execute" step; it generates a result and advances phase.
  (:action executor-execute
    :parameters (?a - agent ?s - step ?p - phase ?pnext - phase ?r - result)
    :precondition (and
      (assigned ?s ?a)
      (step-of ?s ?p)
      (current-phase ?p)
      (successor ?p ?pnext)
      (not (completed ?s))
    )
    :effect (and
      (completed ?s)
      (result-generated ?r)
      (not (current-phase ?p))
      (current-phase ?pnext)
    )
  )

  ;; Auditor performs the "verify" step; requires generated result and advances to terminal phase.
  (:action auditor-verify
    :parameters (?a - agent ?s - step ?p - phase ?pnext - phase ?r - result)
    :precondition (and
      (assigned ?s ?a)
      (step-of ?s ?p)
      (current-phase ?p)
      (successor ?p ?pnext)
      (not (completed ?s))
      (result-generated ?r)
    )
    :effect (and
      (completed ?s)
      (verified ?r)
      (not (current-phase ?p))
      (current-phase ?pnext)
    )
  )
)