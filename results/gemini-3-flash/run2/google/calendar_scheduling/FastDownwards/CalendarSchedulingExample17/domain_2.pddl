(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:constants margaret donna helen - person)
  (:predicates
    (available ?p - person ?t - timeslot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and 
      (available margaret ?t)
      (available donna ?t)
      (available helen ?t)
    )
    :effect (meeting_scheduled)
  )
)