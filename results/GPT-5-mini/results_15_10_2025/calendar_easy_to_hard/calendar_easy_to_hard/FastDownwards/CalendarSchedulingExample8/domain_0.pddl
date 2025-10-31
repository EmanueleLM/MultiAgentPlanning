(define (domain meeting-scheduler)
  (:requirements :typing :negative-preconditions :fluents)
  (:types person timeslot)
  (:predicates
    (free ?p - person ?t - timeslot)
    (scheduled ?t - timeslot)
    (meeting-scheduled)
  )
  (:functions
    (total-cost)
    (slot-cost ?t - timeslot)
  )
  ;; Single parameterized scheduling action: requires the slot to be free for every participant.
  (:action schedule
    :parameters (?t - timeslot)
    :precondition (and
      (not (scheduled ?t))
      (free adam ?t)
      (free jerry ?t)
      (free matthew ?t)
    )
    :effect (and
      (scheduled ?t)
      (meeting-scheduled)
      (increase (total-cost) (slot-cost ?t))
    )
  )
)