(define (domain meeting-scheduling)
  (:requirements :typing)
  (:types participant time)
  (:predicates
    (free ?p - participant ?t - time)
    (scheduled ?t - time)
    (unscheduled)
  )
  (:action schedule
    :parameters (?t - time)
    :precondition (and
      (unscheduled)
      (free peter ?t)
      (free judith ?t)
      (free keith ?t)
      (free evelyn ?t)
    )
    :effect (and
      (scheduled ?t)
      (not (unscheduled))
    )
  )
)