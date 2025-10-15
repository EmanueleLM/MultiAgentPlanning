(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person time)
  (:predicates
    (available ?p - person ?t - time)
    (attending ?p - person ?t - time)
    (scheduled ?t - time)
    (meeting-scheduled)
  )

  (:action attend-amy
    :parameters (?t - time)
    :precondition (available amy ?t)
    :effect (and (attending amy ?t) (not (available amy ?t)))
  )

  (:action attend-jonathan
    :parameters (?t - time)
    :precondition (available jonathan ?t)
    :effect (and (attending jonathan ?t) (not (available jonathan ?t)))
  )

  (:action attend-brittany
    :parameters (?t - time)
    :precondition (available brittany ?t)
    :effect (and (attending brittany ?t) (not (available brittany ?t)))
  )

  (:action attend-matthew
    :parameters (?t - time)
    :precondition (available matthew ?t)
    :effect (and (attending matthew ?t) (not (available matthew ?t)))
  )

  (:action attend-catherine
    :parameters (?t - time)
    :precondition (available catherine ?t)
    :effect (and (attending catherine ?t) (not (available catherine ?t)))
  )

  (:action attend-carl
    :parameters (?t - time)
    :precondition (available carl ?t)
    :effect (and (attending carl ?t) (not (available carl ?t)))
  )

  (:action schedule-meeting
    :parameters (?t - time)
    :precondition (and
      (attending amy ?t)
      (attending jonathan ?t)
      (attending brittany ?t)
      (attending matthew ?t)
      (attending catherine ?t)
      (attending carl ?t)
    )
    :effect (and
      (scheduled ?t)
      (meeting-scheduled)
    )
  )
)