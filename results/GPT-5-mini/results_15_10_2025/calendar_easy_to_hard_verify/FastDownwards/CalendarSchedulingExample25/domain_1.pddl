(define (domain calendar-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person time)
  (:predicates
    (free ?p - person ?t - time)
    (scheduled ?t - time)
  )

  (:action schedule
    :parameters (?t - time)
    :precondition (and
      (not (scheduled ?t))
      (free julia ?t)
      (free joshua ?t)
      (free nicholas ?t)
      (free david ?t)
      (free melissa ?t)
    )
    :effect (and (scheduled ?t))
  )
)