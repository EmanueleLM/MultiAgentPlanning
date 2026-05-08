(define (domain monday_meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:predicates
    (available ?p - participant ?s - slot)
    (required-for ?m - meeting ?p - participant)
    (allowed-slot ?m - meeting ?s - slot)
    (scheduled ?m - meeting)
    (scheduled-at ?m - meeting ?s - slot)
  )

  (:action schedule-meeting-at
    :parameters (?m - meeting ?s - slot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (not (scheduled ?m))
      (allowed-slot ?m ?s)
      (required-for ?m ?p1)
      (required-for ?m ?p2)
      (required-for ?m ?p3)
      (available ?p1 ?s)
      (available ?p2 ?s)
      (available ?p3 ?s)
    )
    :effect (and
      (scheduled ?m)
      (scheduled-at ?m ?s)
    )
  )
)