(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:constants
    diana ethan janet - person
  )
  (:predicates
    (free ?p - person ?t - timeslot)
    (scheduled)
  )
  (:action schedule
    :parameters (?t - timeslot)
    :precondition (and
      (free diana ?t)
      (free ethan ?t)
      (free janet ?t)
    )
    :effect (scheduled)
  )
)