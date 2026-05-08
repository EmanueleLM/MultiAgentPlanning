(define (domain meeting_schedule_monday_halfhour)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (scheduled ?s - slot)
    (meeting_planned)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_planned))
      (free donna ?s)
      (free john ?s)
      (free billy ?s)
    )
    :effect (and
      (meeting_planned)
      (scheduled ?s)
    )
  )
)