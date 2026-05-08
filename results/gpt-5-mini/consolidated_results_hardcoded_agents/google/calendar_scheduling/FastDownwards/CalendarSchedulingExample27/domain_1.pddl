(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:predicates
    (free ?p - participant ?t - timeslot)
    (scheduled ?t - timeslot)
  )

  (:action schedule
    :parameters (?t - timeslot)
    :precondition (and
      (free jesse ?t)
      (free kathryn ?t)
      (free megan ?t)
      (not (scheduled ?t))
    )
    :effect (and
      (scheduled ?t)
    )
  )
)