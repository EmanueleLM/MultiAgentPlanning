(define (domain calendar_scheduling_example46)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    meeting
    slot
  )

  (:predicates
    (requires_participant ?m - meeting ?p - participant)
    (blocked ?p - participant ?s - slot)
    (free ?p - participant ?s - slot)
    (scheduled_at ?m - meeting ?s - slot)
    (unscheduled ?m - meeting)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition
      (and
        (unscheduled ?m)
        (requires_participant ?m arthur)
        (requires_participant ?m theresa)
        (requires_participant ?m carl)
        (free arthur ?s)
        (free theresa ?s)
        (free carl ?s)
        (not (blocked arthur ?s))
        (not (blocked theresa ?s))
        (not (blocked carl ?s))
      )
    :effect
      (and
        (scheduled_at ?m ?s)
        (not (unscheduled ?m))
      )
  )
)