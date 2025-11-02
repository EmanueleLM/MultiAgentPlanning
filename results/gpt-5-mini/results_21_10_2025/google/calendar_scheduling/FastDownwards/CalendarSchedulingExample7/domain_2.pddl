(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types participant timeslot)

  ;; declare the three participants as domain constants so actions can refer to them directly
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

  ;; Schedule a meeting in a preferred timeslot (cost 0)
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

  ;; Schedule a meeting in a dispreferred timeslot (cost 1)
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