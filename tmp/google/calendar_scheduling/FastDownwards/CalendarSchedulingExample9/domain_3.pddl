(define (domain calendar-scheduling)
  (:requirements :strips :typing)
  (:types
    person time_slot)
  (:predicates
    (busy ?p - person ?t - time_slot)
    (available ?p - person ?t - time_slot)
    (meeting-scheduled ?p1 - person ?p2 - person ?t - time_slot)
  )
  (:action schedule-meeting
    :parameters (?p1 - person ?p2 - person ?t - time_slot)
    :precondition (and
      (available ?p1 ?t)
      (available ?p2 ?t)
      (not (busy ?p1 ?t))
      (not (busy ?p2 ?t))
    )
    :effect (and
      (meeting-scheduled ?p1 ?p2 ?t)
      (not (available ?p1 ?t))
      (not (available ?p2 ?t))
    )
  )
)