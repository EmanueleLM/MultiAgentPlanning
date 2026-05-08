(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    meeting
    slot
  )

  (:predicates
    (unscheduled ?m - meeting)
    (scheduled ?m - meeting ?s - slot)
    (busy ?p - participant ?s - slot)
    (requires ?m - meeting ?p - participant)
    (allowed_slot ?m - meeting ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?p1 - participant ?p2 - participant ?p3 - participant ?s - slot)
    :precondition (and
      (unscheduled ?m)
      (allowed_slot ?m ?s)
      (requires ?m ?p1)
      (requires ?m ?p2)
      (requires ?m ?p3)
      (not (busy ?p1 ?s))
      (not (busy ?p2 ?s))
      (not (busy ?p3 ?s))
    )
    :effect (and
      (not (unscheduled ?m))
      (scheduled ?m ?s)
    )
  )
)