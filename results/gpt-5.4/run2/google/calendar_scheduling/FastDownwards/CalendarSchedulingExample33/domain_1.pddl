(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    lisa bobby randy - participant
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (allowed_for_meeting ?s - slot)
    (scheduled ?s - slot)
    (meeting_scheduled)
  )

  (:action schedule_meeting_at
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (allowed_for_meeting ?s)
      (free lisa ?s)
      (free bobby ?s)
      (free randy ?s)
    )
    :effect (and
      (meeting_scheduled)
      (scheduled ?s)
    )
  )
)