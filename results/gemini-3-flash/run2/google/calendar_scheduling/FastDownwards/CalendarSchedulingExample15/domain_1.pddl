(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:constants
    joyce christine alexander - person
  )
  (:predicates
    (free ?p - person ?t - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and (free joyce ?t)
                       (free christine ?t)
                       (free alexander ?t))
    :effect (meeting_scheduled)
  )
)