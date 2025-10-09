(define (domain calendar-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person time)
  (:predicates
    (free ?p - person ?t - time)
    (scheduled ?t - time)
  )

  (:action schedule
    :parameters (?t - time ?p1 - person ?p2 - person ?p3 - person ?p4 - person ?p5 - person)
    :precondition (and
      (not (scheduled ?t))
      (free ?p1 ?t)
      (free ?p2 ?t)
      (free ?p3 ?t)
      (free ?p4 ?t)
      (free ?p5 ?t)
    )
    :effect (and (scheduled ?t))
  )
)