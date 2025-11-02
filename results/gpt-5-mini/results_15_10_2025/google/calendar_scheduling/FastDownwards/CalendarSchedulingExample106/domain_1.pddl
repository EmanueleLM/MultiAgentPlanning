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
      (available Olivia ?t)
      (available Anna ?t)
      (available Virginia ?t)
      (available Paul ?t)
    )
    :effect (and (scheduled))
  )
)