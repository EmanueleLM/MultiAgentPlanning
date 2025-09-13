(define (domain calendar)
  (:requirements :strips :typing)
  (:types person time-slot)
  (:predicates
    (available ?p - person ?t - time-slot)
    (meeting_scheduled ?p - person)
  )

  (:action schedule_meeting
    :parameters (?p - person ?t - time-slot)
    :precondition (available ?p ?t)
    :effect (meeting_scheduled ?p)
  )
)