(define (domain meeting_schedule_monday_halfhour)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (busy ?p - participant ?s - slot)
    (scheduled_at ?s - slot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?p1 - participant ?p2 - participant ?p3 - participant ?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (not (busy ?p1 ?s))
      (not (busy ?p2 ?s))
      (not (busy ?p3 ?s))
    )
    :effect (and
      (scheduled_at ?s)
      (meeting_scheduled)
    )
  )
)