(define (domain calendar-scheduling)
  (:requirements :typing)
  (:types participant time)
  (:predicates
    (free ?p - participant ?t - time)
    (scheduled ?t - time)
    (done)
  )
  (:action schedule
    :parameters (?t - time)
    :precondition (and
      (free julia ?t)
      (free joshua ?t)
      (free nicholas ?t)
      (free david ?t)
      (free melissa ?t)
    )
    :effect (and
      (scheduled ?t)
      (done)
    )
  )
)