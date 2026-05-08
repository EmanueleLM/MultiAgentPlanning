(define (domain calendar-meeting)
  (:requirements :typing :strips :negative-preconditions)
  (:types person timeslot)
  (:predicates
    (free ?p - person ?t - timeslot)
    (allowed ?t - timeslot)
    (scheduled)
  )
  (:action schedule-at
    :parameters (?t - timeslot)
    :precondition (and (not (scheduled)) (allowed ?t) (free kathryn ?t) (free charlotte ?t) (free lauren ?t))
    :effect (and (scheduled))
  )
)