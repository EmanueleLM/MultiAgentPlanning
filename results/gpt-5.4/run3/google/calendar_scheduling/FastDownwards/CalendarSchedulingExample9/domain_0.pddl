(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing)

  (:types
    participant
    meeting
    slot
  )

  (:predicates
    (participant_available ?p - participant ?s - slot)
    (meeting_unscheduled ?m - meeting)
    (meeting_scheduled ?m - meeting ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (meeting_unscheduled ?m)
      (participant_available diane ?s)
      (participant_available kelly ?s)
      (participant_available deborah ?s)
    )
    :effect (and
      (meeting_scheduled ?m ?s)
      (not (meeting_unscheduled ?m))
    )
  )
)