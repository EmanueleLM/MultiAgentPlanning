(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)

  (:predicates
    (free ?p - participant ?t - timeslot)
    (scheduled ?t - timeslot)
    (next ?t1 - timeslot ?t2 - timeslot)
  )

  (:action schedule
    :parameters (?t - timeslot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (free ?p1 ?t)
      (free ?p2 ?t)
      (free ?p3 ?t)
      (not (scheduled ?t))
    )
    :effect (and
      (scheduled ?t)
      (not (free ?p1 ?t))
      (not (free ?p2 ?t))
      (not (free ?p3 ?t))
    )
  )
)