(define (domain calendar)
  (:requirements :strips :typing)
  (:types person time-slot)
  (:predicates
    (available ?p - person ?t1 - time-slot ?t2 - time-slot)
    (meeting_scheduled ?p - person)
  )

  (:action schedule_meeting
    :parameters (?p - person ?t1 - time-slot ?t2 - time-slot)
    :precondition (available ?p ?t1 ?t2)
    :effect (meeting_scheduled ?p)
  )
)