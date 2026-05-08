(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types
    person
    timeslot
  )
  (:predicates
    (is_free ?p - person ?s - timeslot)
    (meeting_scheduled ?s - timeslot)
    (goal_achieved)
  )
  (:action schedule_half_hour_meeting
    :parameters (?s - timeslot)
    :precondition (and
      (is_free margaret ?s)
      (is_free donna ?s)
      (is_free helen ?s)
    )
    :effect (and
      (meeting_scheduled ?s)
      (goal_achieved)
    )
  )
)