(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:constants
    bradley zachary teresa - person
  )
  (:predicates
    (free ?p - person ?t - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and 
      (free bradley ?t)
      (free zachary ?t)
      (free teresa ?t)
    )
    :effect (meeting_scheduled)
  )
)