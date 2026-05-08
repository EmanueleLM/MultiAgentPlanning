(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent task phase)

  (:predicates
    ;; assignment and locality
    (assigned ?t - task ?a - agent)
    (task-in-phase ?t - task ?p - phase)

    ;; task and lifecycle markers
    (completed ?t - task)

    ;; explicit ordered phases
    (phase-active ?p - phase)
    (phase-succ ?p1 - phase ?p2 - phase)

    ;; audit and report terminal predicates
    (audit-passed)
    (report-finalized)
  )

  ;; Analyst A collects source data in its phase and advances the phase sequence
  (:action analystA-collect
    :parameters (?a - agent ?t - task ?p - phase ?next - phase)
    :precondition (and
      (assigned ?t ?a)
      (task-in-phase ?t ?p)
      (phase-active ?p)
      (phase-succ ?p ?next)
      (not (completed ?t))
    )
    :effect (and
      (completed ?t)
      (not (phase-active ?p))
      (phase-active ?next)
    )
  )

  ;; Analyst B performs analysis that depends on a prerequisite task being completed, then advances the phase
  (:action analystB-analyze
    :parameters (?a - agent ?t - task ?pre - task ?p - phase ?next - phase)
    :precondition (and
      (assigned ?t ?a)
      (task-in-phase ?t ?p)
      (phase-active ?p)
      (phase-succ ?p ?next)
      (completed ?pre)                ;; explicit dependency on prior completed task
      (not (completed ?t))
    )
    :effect (and
      (completed ?t)
      (not (phase-active ?p))
      (phase-active ?next)
    )
  )

  ;; Auditor performs audit that depends on an analysis task being completed, marks audit outcome, and advances the phase
  (:action auditor-audit
    :parameters (?aud - agent ?t - task ?pre - task ?p - phase ?next - phase)
    :precondition (and
      (assigned ?t ?aud)
      (task-in-phase ?t ?p)
      (phase-active ?p)
      (phase-succ ?p ?next)
      (completed ?pre)                ;; requires analysis completed
      (not (completed ?t))
    )
    :effect (and
      (completed ?t)
      (audit-passed)
      (not (phase-active ?p))
      (phase-active ?next)
    )
  )

  ;; Orchestrator finalizes the report; requires audit completed and the phase to be active.
  ;; This action sets the final terminal predicate but does not advance phases (final phase remains active).
  (:action orchestrator-finalize
    :parameters (?org - agent ?t - task ?pre - task ?p - phase)
    :precondition (and
      (assigned ?t ?org)
      (task-in-phase ?t ?p)
      (phase-active ?p)
      (completed ?pre)                ;; requires audit completed
      (not (completed ?t))
      (not (report-finalized))
    )
    :effect (and
      (completed ?t)
      (report-finalized)
      ;; do not change phase-active here so final phase remains active
    )
  )
)