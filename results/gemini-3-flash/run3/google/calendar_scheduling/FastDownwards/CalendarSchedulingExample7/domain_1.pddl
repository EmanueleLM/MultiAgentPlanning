(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:predicates
    (free ?p - person ?s - timeslot)
    (any_meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?s - timeslot)
    :precondition (and
      (free heather ?s)
      (free nicholas ?s)
      (free zachary ?s)
    )
    :effect (any_meeting_scheduled)
  )
)