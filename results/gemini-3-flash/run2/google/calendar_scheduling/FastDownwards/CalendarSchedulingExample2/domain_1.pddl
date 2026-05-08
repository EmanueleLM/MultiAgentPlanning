(define (domain calendar_scheduling)
  (:requirements :typing)
  (:types person timeslot)
  (:constants
    roy kathryn amy - person
  )
  (:predicates
    (available ?p - person ?t - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (available roy ?t)
      (available kathryn ?t)
      (available amy ?t)
    )
    :effect (meeting_scheduled)
  )
)