(define (domain monday_meeting_scheduling_instance)
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
    (allowed_slot ?s - slot)
    (scheduled ?s - slot)
    (meeting_scheduled)
  )

  (:action schedule_meeting_in_slot
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (allowed_slot ?s)
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