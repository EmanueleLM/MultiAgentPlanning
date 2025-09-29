(define (domain calendar-scheduling)
  (:requirements :strips :typing)
  (:types person time)
  (:predicates
    (free ?p - person ?t - time)
    (scheduled ?t - time)
    (meeting-scheduled)
  )
  (:action schedule
    :parameters (?t - time)
    :precondition (and
      (free ronald ?t)
      (free stephen ?t)
      (free brittany ?t)
      (free dorothy ?t)
      (free rebecca ?t)
      (free jordan ?t)
    )
    :effect (and
      (scheduled ?t)
      (meeting-scheduled)
    )
  )
)