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
    (disallowed_for_meeting ?m - meeting ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (unscheduled ?m)
      (requires ?m ?p1)
      (requires ?m ?p2)
      (requires ?m ?p3)
      (not (disallowed_for_meeting ?m ?s))
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