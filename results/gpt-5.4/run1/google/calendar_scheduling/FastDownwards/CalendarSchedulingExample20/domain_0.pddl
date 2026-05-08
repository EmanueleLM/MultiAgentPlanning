(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:predicates
    (participant_required ?m - meeting ?p - participant)
    (free ?p - participant ?s - slot)
    (acceptable ?p - participant ?s - slot)
    (slot_open ?s - slot)
    (scheduled ?m - meeting ?s - slot)
    (meeting_unscheduled ?m - meeting)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (meeting_unscheduled ?m)
      (slot_open ?s)
      (participant_required ?m ralph)
      (participant_required ?m peter)
      (participant_required ?m daniel)
      (free ralph ?s)
      (free peter ?s)
      (free daniel ?s)
      (acceptable ralph ?s)
      (acceptable peter ?s)
      (acceptable daniel ?s)
    )
    :effect (and
      (scheduled ?m ?s)
      (not (meeting_unscheduled ?m))
    )
  )
)