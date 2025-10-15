(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person time)
  (:predicates
    (available ?p - person ?t - time)
    (scheduled ?t - time)
    (meeting-scheduled)
  )
  (:action schedule
    :parameters (?t - time)
    :precondition (and
      (available amy ?t)
      (available jonathan ?t)
      (available brittany ?t)
      (available matthew ?t)
      (available catherine ?t)
      (available carl ?t)
    )
    :effect (and
      (scheduled ?t)
      (meeting-scheduled)
    )
  )
)