(define (domain monday_meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (busy ?p - participant ?s - slot)
    (unscheduled)
    (scheduled)
    (meeting_scheduled_at ?s - slot)
  )

  (:action schedule_meeting_at
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (not (busy adam ?s))
      (not (busy jerry ?s))
      (not (busy matthew ?s))
    )
    :effect (and
      (scheduled)
      (meeting_scheduled_at ?s)
      (not (unscheduled))
    )
  )
)