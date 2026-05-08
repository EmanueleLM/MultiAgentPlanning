(define (domain orchestration)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent task phase)

  ;; Canonical constants for this instance-level, declared here so action schemas can
  ;; refer to concrete phases and tasks when specific phase-task membership or
  ;; final-phase behavior must be enforced explicitly.
  (:constants
    p1 p2 p3 - phase
    tA tB tC - task
    alice bob - agent
  )

  (:predicates
    (agent ?a - agent)
    (task ?t - task)
    (phase ?p - phase)

    ;; successor relation enforcing a strict ordered phase sequence
    (succ ?p1 - phase ?p2 - phase)

    ;; phase control predicates
    (phase-active ?p - phase)
    (phase-done ?p - phase)

    ;; task membership and completion
    (task-in-phase ?t - task ?p - phase)
    (task-completed ?t - task)

    ;; agent capability mapping: which agent may perform which task
    (can-perform ?a - agent ?t - task)
  )

  ;; Action: an agent completes a task that belongs to the currently active phase
  ;; and for which the agent has explicit permission (capability).
  (:action complete-task
    :parameters (?a - agent ?t - task ?p - phase)
    :precondition (and
      (phase-active ?p)
      (task-in-phase ?t ?p)
      (can-perform ?a ?t)
      (not (task-completed ?t))
    )
    :effect (and
      (task-completed ?t)
    )
  )

  ;; The following finish-phase actions are explicit for each phase. Each one
  ;; requires the tasks assigned to that phase to be completed before the phase
  ;; can be marked done and the successor phase activated. Because universal
  ;; quantification over tasks is not available in :strips-only settings, each
  ;; finish action references the concrete tasks for that phase to make the
  ;; "all tasks completed" requirement impossible to violate.
  (:action finish-phase-p1
    :parameters ()
    :precondition (and
      (phase-active p1)
      ;; phase 1 has exactly tA, require it completed before finishing p1
      (task-completed tA)
    )
    :effect (and
      (not (phase-active p1))
      (phase-done p1)
      (phase-active p2)
    )
  )

  (:action finish-phase-p2
    :parameters ()
    :precondition (and
      (phase-active p2)
      ;; phase 2 has exactly tB, require it completed before finishing p2
      (task-completed tB)
    )
    :effect (and
      (not (phase-active p2))
      (phase-done p2)
      (phase-active p3)
    )
  )

  (:action finish-phase-p3
    :parameters ()
    :precondition (and
      (phase-active p3)
      ;; phase 3 has exactly tC, require it completed before finishing p3
      (task-completed tC)
    )
    :effect (and
      (not (phase-active p3))
      (phase-done p3)
    )
  )
)