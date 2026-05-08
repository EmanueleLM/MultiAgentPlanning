(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:constants
    heather nicholas zachary - person
  )
  (:predicates
    (available ?p - person ?t - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (available heather ?t)
      (available nicholas ?t)
      (available zachary ?t)
    )
    :effect (meeting_scheduled)
  )
)