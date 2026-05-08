(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:constants roy kathryn amy - person)
  (:predicates
    (free ?p - person ?t - timeslot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (free roy ?t)
      (free kathryn ?t)
      (free amy ?t)
    )
    :effect (meeting_scheduled)
  )
)