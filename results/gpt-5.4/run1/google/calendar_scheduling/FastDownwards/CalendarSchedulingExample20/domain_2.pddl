(define (domain calendar_scheduling_example20)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:predicates
    (meeting_unscheduled ?m - meeting)
    (participant_required ?m - meeting ?p - participant)
    (free ?p - participant ?s - slot)
    (preferred ?p - participant ?s - slot)
    (scheduled_at ?m - meeting ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (meeting_unscheduled ?m)
      (participant_required ?m ralph)
      (participant_required ?m peter)
      (participant_required ?m daniel)
      (free ralph ?s)
      (free peter ?s)
      (free daniel ?s)
      (preferred daniel ?s)
    )
    :effect (and
      (scheduled_at ?m ?s)
      (not (meeting_unscheduled ?m))
    )
  )
)