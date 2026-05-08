(define (domain monday_meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (busy ?p - participant ?s - slot)
    (free ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (meeting_unscheduled)
    (scheduled ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (meeting_unscheduled)
      (free roy ?s)
      (free kathryn ?s)
      (free amy ?s)
      (not (scheduled ?s))
    )
    :effect (and
      (scheduled ?s)
      (not (meeting_unscheduled))
    )
  )
)