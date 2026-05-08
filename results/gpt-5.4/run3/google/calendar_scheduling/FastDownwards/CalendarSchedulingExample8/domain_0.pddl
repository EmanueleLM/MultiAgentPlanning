(define (domain meeting_schedule_monday_halfhour)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (busy ?p - participant ?s - slot)
    (required ?p - participant)
    (scheduled_at ?s - slot)
    (meeting_scheduled)
    (next_slot ?s1 - slot ?s2 - slot)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (not (busy adam ?s))
      (not (busy jerry ?s))
      (not (busy matthew ?s))
    )
    :effect (and
      (scheduled_at ?s)
      (meeting_scheduled)
    )
  )
)