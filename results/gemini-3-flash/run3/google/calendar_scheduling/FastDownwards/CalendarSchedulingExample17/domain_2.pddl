(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types
    person
    timeslot
  )
  (:constants
    margaret donna helen - person
  )
  (:predicates
    (free ?p - person ?s - timeslot)
    (goal_achieved)
  )
  (:action schedule_half_hour_meeting
    :parameters (?s - timeslot)
    :precondition (and
      (free margaret ?s)
      (free donna ?s)
      (free helen ?s)
    )
    :effect (goal_achieved)
  )
)