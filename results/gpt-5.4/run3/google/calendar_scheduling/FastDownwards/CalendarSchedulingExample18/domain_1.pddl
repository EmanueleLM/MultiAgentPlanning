(define (domain schedule_meeting_monday)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    brian billy patricia - participant
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (allowed_start ?s - slot)
    (scheduled)
    (meeting_at ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (not (scheduled))
      (allowed_start ?s)
      (free brian ?s)
      (free billy ?s)
      (free patricia ?s)
    )
    :effect (and
      (scheduled)
      (meeting_at ?s)
    )
  )
)