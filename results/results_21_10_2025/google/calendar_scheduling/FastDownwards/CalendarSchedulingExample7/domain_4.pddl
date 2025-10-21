(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types participant timeslot)
  (:constants heather nicholas zachary - participant)
  (:predicates
    (available ?p - participant ?t - timeslot)
    (preferred ?t - timeslot)
    (scheduled)
    (meeting-at ?t - timeslot)
  )
  (:functions
    (total-cost)
  )
  (:action schedule-meeting-preferred
    :parameters (?t - timeslot)
    :precondition (and
      (available heather ?t)
      (available nicholas ?t)
      (available zachary ?t)
      (preferred ?t)
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (meeting-at ?t)
      (increase (total-cost) 0)
    )
  )
  (:action schedule-meeting-dispreferred
    :parameters (?t - timeslot)
    :precondition (and
      (available heather ?t)
      (available nicholas ?t)
      (available zachary ?t)
      (not (preferred ?t))
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (meeting-at ?t)
      (increase (total-cost) 1)
    )
  )
)