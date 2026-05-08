(define (domain meeting_scheduler_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (required ?p - participant)
    (free ?p - participant ?s - slot)
    (meeting_scheduled)
    (chosen_start ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (required adam)
      (required jerry)
      (required matthew)
      (free adam ?s)
      (free jerry ?s)
      (free matthew ?s)
    )
    :effect (and
      (meeting_scheduled)
      (chosen_start ?s)
    )
  )
)