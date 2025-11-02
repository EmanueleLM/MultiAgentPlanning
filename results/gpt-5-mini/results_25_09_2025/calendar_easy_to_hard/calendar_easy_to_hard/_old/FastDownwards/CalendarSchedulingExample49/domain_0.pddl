(define (domain meeting-scheduler)
  (:requirements :typing :adl)
  (:types person timeslot meeting)
  (:predicates
    (scheduled ?m - meeting ?t - timeslot)
    (participant ?p - person ?m - meeting)
    (busy ?p - person ?t - timeslot)
    (prefers ?p - person ?t - timeslot)
  )

  ;; Schedule meeting at a timeslot if not already scheduled and
  ;; no participant is busy at that timeslot.
  (:action schedule-meeting
    :parameters (?m - meeting ?t - timeslot)
    :precondition (and
      (not (exists (?tt - timeslot) (scheduled ?m ?tt)))
      (forall (?p - person) (imply (participant ?p ?m) (not (busy ?p ?t))))
    )
    :effect (scheduled ?m ?t)
  )

  ;; Alternative action that schedules only if every participant prefers the timeslot.
  ;; This is optional; use if you want to require unanimous preference.
  (:action schedule-preferred
    :parameters (?m - meeting ?t - timeslot)
    :precondition (and
      (not (exists (?tt - timeslot) (scheduled ?m ?tt)))
      (forall (?p - person)
        (imply (participant ?p ?m)
               (and (not (busy ?p ?t)) (prefers ?p ?t))))
    )
    :effect (scheduled ?m ?t)
  )
)