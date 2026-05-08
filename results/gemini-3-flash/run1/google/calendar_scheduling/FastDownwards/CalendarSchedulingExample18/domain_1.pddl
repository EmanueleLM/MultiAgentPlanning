(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:constants
    brian billy patricia - person
  )
  (:predicates
    (available ?p - person ?t - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and 
      (available brian ?t)
      (available billy ?t)
      (available patricia ?t)
    )
    :effect (meeting_scheduled)
  )
)