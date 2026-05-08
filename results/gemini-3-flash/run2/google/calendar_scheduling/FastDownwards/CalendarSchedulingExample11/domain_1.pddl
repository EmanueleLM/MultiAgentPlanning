(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types
    person
    timeslot
  )
  (:predicates
    (available ?p - person ?t - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (available alexander ?t)
      (available elizabeth ?t)
      (available walter ?t)
    )
    :effect (and
      (meeting_scheduled)
    )
  )
)