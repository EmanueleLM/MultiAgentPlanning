(define (domain meeting-scheduler)
  (:requirements :typing :negative-preconditions :adl)
  (:types person timeslot meeting)
  (:predicates
    (participant ?p - person ?m - meeting)
    (busy ?p - person ?t - timeslot)
    (prefers ?p - person ?t - timeslot)
    (scheduled ?m - meeting ?t - timeslot)
    (unscheduled ?m - meeting)
  )
  (:action schedule-meeting
    :parameters (?m - meeting ?t - timeslot)
    :precondition (and
      (unscheduled ?m)
      (forall (?p - person)
        (imply (participant ?p ?m)
               (not (busy ?p ?t))))
    )
    :effect (and
      (scheduled ?m ?t)
      (not (unscheduled ?m))
    )
  )
)