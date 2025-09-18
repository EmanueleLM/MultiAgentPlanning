(define (domain orchestrated-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (ralph_free ?s - slot)
    (peter_free ?s - slot)
    (daniel_available ?s - slot)
    (daniel_undesirable ?s - slot)
    (unscheduled)
    (meeting_scheduled)
    (scheduled_at ?s - slot)
    (good_slot_available)
  )

  (:action schedule_by_ralph_good
    :parameters (?s - slot)
    :precondition (and (unscheduled) (ralph_free ?s) (peter_free ?s) (daniel_available ?s) (not (daniel_undesirable ?s)))
    :effect (and (meeting_scheduled) (scheduled_at ?s) (not (unscheduled)))
  )

  (:action schedule_by_ralph_bad
    :parameters (?s - slot)
    :precondition (and (unscheduled) (ralph_free ?s) (peter_free ?s) (daniel_available ?s) (daniel_undesirable ?s) (not (good_slot_available)))
    :effect (and (meeting_scheduled) (scheduled_at ?s) (not (unscheduled)))
  )

  (:action schedule_by_peter_good
    :parameters (?s - slot)
    :precondition (and (unscheduled) (ralph_free ?s) (peter_free ?s) (daniel_available ?s) (not (daniel_undesirable ?s)))
    :effect (and (meeting_scheduled) (scheduled_at ?s) (not (unscheduled)))
  )

  (:action schedule_by_peter_bad
    :parameters (?s - slot)
    :precondition (and (unscheduled) (ralph_free ?s) (peter_free ?s) (daniel_available ?s) (daniel_undesirable ?s) (not (good_slot_available)))
    :effect (and (meeting_scheduled) (scheduled_at ?s) (not (unscheduled)))
  )

  (:action schedule_by_daniel_good
    :parameters (?s - slot)
    :precondition (and (unscheduled) (ralph_free ?s) (peter_free ?s) (daniel_available ?s) (not (daniel_undesirable ?s)))
    :effect (and (meeting_scheduled) (scheduled_at ?s) (not (unscheduled)))
  )

  (:action schedule_by_daniel_bad
    :parameters (?s - slot)
    :precondition (and (unscheduled) (ralph_free ?s) (peter_free ?s) (daniel_available ?s) (daniel_undesirable ?s) (not (good_slot_available)))
    :effect (and (meeting_scheduled) (scheduled_at ?s) (not (unscheduled)))
  )
)