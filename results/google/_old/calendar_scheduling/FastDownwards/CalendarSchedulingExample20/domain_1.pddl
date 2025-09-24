(define (domain orchestrated-scheduling)
  (:requirements :strips :typing :adl :action-costs)
  (:types person slot)
  (:predicates
    (slot ?s - slot)

    ;; Participant-specific availability predicates (kept distinct per agent)
    (ralph_free ?s - slot)
    (peter_free ?s - slot)
    (daniel_available ?s - slot)

    ;; Daniel's undesirable times (preference marker)
    (daniel_undesirable ?s - slot)

    ;; Meeting state
    (unscheduled)
    (meeting_scheduled)
    (scheduled_at ?s - slot)
  )

  ;; Ralph schedules (two variants to represent cost depending on Daniel's preference)
  (:action schedule_by_ralph_good
    :parameters (?s - slot)
    :precondition (and (unscheduled) (slot ?s) (ralph_free ?s) (peter_free ?s) (daniel_available ?s) (not (daniel_undesirable ?s)))
    :effect (and (meeting_scheduled) (scheduled_at ?s) (not (unscheduled)))
    :cost 0
  )

  (:action schedule_by_ralph_bad
    :parameters (?s - slot)
    :precondition (and (unscheduled) (slot ?s) (ralph_free ?s) (peter_free ?s) (daniel_available ?s) (daniel_undesirable ?s))
    :effect (and (meeting_scheduled) (scheduled_at ?s) (not (unscheduled)))
    :cost 1
  )

  ;; Peter schedules (two variants)
  (:action schedule_by_peter_good
    :parameters (?s - slot)
    :precondition (and (unscheduled) (slot ?s) (ralph_free ?s) (peter_free ?s) (daniel_available ?s) (not (daniel_undesirable ?s)))
    :effect (and (meeting_scheduled) (scheduled_at ?s) (not (unscheduled)))
    :cost 0
  )

  (:action schedule_by_peter_bad
    :parameters (?s - slot)
    :precondition (and (unscheduled) (slot ?s) (ralph_free ?s) (peter_free ?s) (daniel_available ?s) (daniel_undesirable ?s))
    :effect (and (meeting_scheduled) (scheduled_at ?s) (not (unscheduled)))
    :cost 1
  )

  ;; Daniel schedules (two variants)
  (:action schedule_by_daniel_good
    :parameters (?s - slot)
    :precondition (and (unscheduled) (slot ?s) (ralph_free ?s) (peter_free ?s) (daniel_available ?s) (not (daniel_undesirable ?s)))
    :effect (and (meeting_scheduled) (scheduled_at ?s) (not (unscheduled)))
    :cost 0
  )

  (:action schedule_by_daniel_bad
    :parameters (?s - slot)
    :precondition (and (unscheduled) (slot ?s) (ralph_free ?s) (peter_free ?s) (daniel_available ?s) (daniel_undesirable ?s))
    :effect (and (meeting_scheduled) (scheduled_at ?s) (not (unscheduled)))
    :cost 1
  )
)