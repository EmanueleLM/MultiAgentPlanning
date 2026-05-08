(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:predicates
    (available ?p - person ?t - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and 
      (available ?p1 ?t)
      (available ?p2 ?t)
      (available ?p3 ?t)
    )
    :effect (meeting_scheduled)
  )
)