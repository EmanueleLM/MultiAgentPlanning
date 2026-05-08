(define (domain monday_meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timeslot
    meeting
  )

  (:predicates
    (available ?p - participant ?s - timeslot)
    (meeting_unscheduled ?m - meeting)
    (scheduled_at ?m - meeting ?s - timeslot)
    (meeting_scheduled ?m - meeting)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - timeslot)
    :precondition (and
      (meeting_unscheduled ?m)
      (available alexander ?s)
      (available elizabeth ?s)
      (available walter ?s)
      (not (meeting_scheduled ?m))
    )
    :effect (and
      (scheduled_at ?m ?s)
      (meeting_scheduled ?m)
      (not (meeting_unscheduled ?m))
    )
  )
)