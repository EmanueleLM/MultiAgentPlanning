(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:constants
    richard martha kimberly - person
  )
  (:predicates
    (available ?p - person ?t - timeslot)
    (scheduled)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (available richard ?t)
      (available martha ?t)
      (available kimberly ?t)
    )
    :effect (scheduled)
  )
)