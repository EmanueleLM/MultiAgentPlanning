(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (available ?p - participant ?s - slot)
    (scheduled ?s - slot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (available isabella ?s)
      (available ronald ?s)
      (available amanda ?s)
    )
    :effect (and
      (meeting_scheduled)
      (scheduled ?s)
    )
  )
)