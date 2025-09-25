(define (domain meeting-scheduler)
  (:requirements :typing :disjunctive-preconditions :negative-preconditions :adl)
  (:types person timeslot meeting)
  (:predicates
    (scheduled ?m - meeting ?t - timeslot)
    (participant ?p - person ?m - meeting)
    (busy ?p - person ?t - timeslot)
    (prefers ?p - person ?t - timeslot)
    (feasible ?m - meeting ?t - timeslot)
    (unscheduled ?m - meeting)
  )
  (:action schedule-meeting
    :parameters (?m - meeting ?t - timeslot)
    :precondition (and
      (unscheduled ?m)
      (feasible ?m ?t)
    )
    :effect (and
      (scheduled ?m ?t)
      (not (unscheduled ?m))
    )
  )
)