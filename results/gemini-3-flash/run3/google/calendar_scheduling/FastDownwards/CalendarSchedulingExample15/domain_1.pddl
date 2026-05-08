(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:constants
    joyce christine alexander - person
  )
  (:predicates
    (available ?p - person ?t - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (available joyce ?t)
      (available christine ?t)
      (available alexander ?t)
    )
    :effect (meeting_scheduled)
  )
)