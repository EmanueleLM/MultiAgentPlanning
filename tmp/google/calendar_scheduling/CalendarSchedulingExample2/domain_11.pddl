(define (domain calendar-scheduling)
  (:requirements :strips :typing)
  (:types person time-slot)
  (:predicates 
    (available ?p - person ?t - time-slot)
    (meeting-scheduled ?t - time-slot))
  (:action schedule-meeting
    :parameters (?p - person ?t - time-slot)
    :precondition (available ?p ?t)
    :effect (meeting-scheduled ?t)
  )
)