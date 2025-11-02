(define (domain calendar-scheduling)
  (:requirements :strips :typing)
  (:types person time)
  (:constants ronald stephen brittany dorothy rebecca jordan - person)
  (:predicates
    (free ?p - person ?t - time)
    (attending ?p - person ?t - time)
    (meeting-scheduled)
    (meeting-start ?t - time)
  )

  (:action attend
    :parameters (?p - person ?t - time)
    :precondition (free ?p ?t)
    :effect (and (attending ?p ?t) (not (free ?p ?t)))
  )

  (:action confirm-meeting
    :parameters (?t - time)
    :precondition (and
      (attending ronald ?t)
      (attending stephen ?t)
      (attending brittany ?t)
      (attending dorothy ?t)
      (attending rebecca ?t)
      (attending jordan ?t)
    )
    :effect (and (meeting-scheduled) (meeting-start ?t))
  )
)