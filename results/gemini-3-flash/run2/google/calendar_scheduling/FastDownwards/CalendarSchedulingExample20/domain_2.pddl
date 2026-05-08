(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:predicates
    (free ?p - person ?t - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and 
      (free ralph ?t)
      (free peter ?t)
      (free daniel ?t)
    )
    :effect (meeting_scheduled)
  )
)