(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person timeslot)

  (:predicates
    (free ?p - person ?t - timeslot)
    (meeting-scheduled)
    (scheduled-at ?t - timeslot)
    (valid-slot ?t - timeslot)
  )

  (:functions
    (total-cost)
  )

  (:action schedule
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
      (valid-slot ?t)
      (free diane ?t)
      (free helen ?t)
      (free arthur ?t)
      (free ethan ?t)
      (free beverly ?t)
      (free deborah ?t)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?t)
      (increase (total-cost) 0)
    )
  )
)