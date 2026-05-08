(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (requires ?m - meeting ?p - participant)
    (scheduled ?m - meeting)
    (scheduled_in ?m - meeting ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (not (scheduled ?m))
      (requires ?m brittany)
      (requires ?m emily)
      (requires ?m doris)
      (free brittany ?s)
      (free emily ?s)
      (free doris ?s)
    )
    :effect (and
      (scheduled ?m)
      (scheduled_in ?m ?s)
    )
  )
)