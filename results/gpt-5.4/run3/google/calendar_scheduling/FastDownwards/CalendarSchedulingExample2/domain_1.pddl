(define (domain monday_meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (meeting_unscheduled)
    (scheduled ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?p1 - participant ?p2 - participant ?p3 - participant ?s - slot)
    :precondition (and
      (meeting_unscheduled)
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
      (not (scheduled ?s))
    )
    :effect (and
      (scheduled ?s)
      (not (meeting_unscheduled))
    )
  )
)