(define (domain calendar-scheduling)
  (:requirements :strips :typing)
  (:types person time)
  (:predicates
    (available ?p - person ?t - time)
    (scheduled)
  )

  (:action schedule-at
    :parameters (?t - time)
    :precondition (and
      (available olivia ?t)
      (available anna ?t)
      (available virginia ?t)
      (available paul ?t)
    )
    :effect (and (scheduled))
  )
)