(define (domain calendar-scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:predicates
    (free ?p - person ?t - timeslot)
    (scheduled ?t - timeslot)
    (meeting-scheduled)
  )
  (:action schedule-meeting
    :parameters (?t - timeslot)
    :precondition (and
      (free ronald ?t)
      (free stephen ?t)
      (free brittany ?t)
      (free dorothy ?t)
      (free rebecca ?t)
      (free jordan ?t)
    )
    :effect (and
      (scheduled ?t)
      (meeting-scheduled)
    )
  )
)