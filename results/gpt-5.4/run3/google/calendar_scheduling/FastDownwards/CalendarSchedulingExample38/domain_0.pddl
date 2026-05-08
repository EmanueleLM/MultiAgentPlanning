(define (domain monday_meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (attendee ?p - participant)
    (slot ?s - slot)
    (busy ?p - participant ?s - slot)
    (scheduled ?s - slot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (not (meeting_scheduled))
      (not (busy catherine ?s))
      (not (busy michael ?s))
      (not (busy alexander ?s))
    )
    :effect (and
      (scheduled ?s)
      (meeting_scheduled)
    )
  )
)