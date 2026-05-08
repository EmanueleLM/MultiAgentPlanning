(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    meeting
    slot
  )

  (:predicates
    (requires ?m - meeting ?p - participant)
    (free ?p - participant ?s - slot)
    (allowed_slot ?m - meeting ?s - slot)
    (scheduled ?m - meeting ?s - slot)
    (meeting_scheduled ?m - meeting)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?p1 - participant ?p2 - participant ?p3 - participant ?s - slot)
    :precondition (and
      (not (meeting_scheduled ?m))
      (requires ?m ?p1)
      (requires ?m ?p2)
      (requires ?m ?p3)
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
      (allowed_slot ?m ?s)
    )
    :effect (and
      (scheduled ?m ?s)
      (meeting_scheduled ?m)
    )
  )
)