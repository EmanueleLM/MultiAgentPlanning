(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:constants
    raymond billy donald - person
  )
  (:predicates
    (free ?p - person ?t - timeslot)
    (scheduled)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (free raymond ?t)
      (free billy ?t)
      (free donald ?t)
    )
    :effect (scheduled)
  )
)