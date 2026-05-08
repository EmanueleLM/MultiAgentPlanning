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
    :parameters (?m - meeting ?p1 - participant ?p2 - participant ?p3 - participant ?s - slot)
    :precondition (and
      (meeting_unscheduled ?m)
      (slot_open ?s)
      (participant_required ?m ?p1)
      (participant_required ?m ?p2)
      (participant_required ?m ?p3)
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
      (acceptable ?p1 ?s)
      (acceptable ?p2 ?s)
      (acceptable ?p3 ?s)
    )
    :effect (and
      (scheduled ?m ?s)
      (not (meeting_unscheduled ?m))
    )
  )
)