(define (domain calendar_scheduling)
  (:requirements :typing)
  (:types person timeslot)
  (:constants
    arthur theresa carl - person
  )
  (:predicates
    (available ?p - person ?t - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (available arthur ?t)
      (available theresa ?t)
      (available carl ?t)
    )
    :effect (and
      (meeting_scheduled)
    )
  )
)