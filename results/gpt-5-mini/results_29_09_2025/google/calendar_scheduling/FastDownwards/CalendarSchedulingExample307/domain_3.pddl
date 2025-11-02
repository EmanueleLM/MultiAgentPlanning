(define (domain calendar-scheduling)
  (:requirements :strips :typing)
  (:types person time)
  (:predicates
    (free ?p - person ?t - time)
    (attending ?p - person ?t - time)
    (meeting-scheduled)
    (meeting-start ?t - time)
  )

  (:action attend-ronald
    :parameters (?t - time)
    :precondition (free ronald ?t)
    :effect (and (attending ronald ?t) (not (free ronald ?t)))
  )

  (:action attend-stephen
    :parameters (?t - time)
    :precondition (free stephen ?t)
    :effect (and (attending stephen ?t) (not (free stephen ?t)))
  )

  (:action attend-brittany
    :parameters (?t - time)
    :precondition (free brittany ?t)
    :effect (and (attending brittany ?t) (not (free brittany ?t)))
  )

  (:action attend-dorothy
    :parameters (?t - time)
    :precondition (free dorothy ?t)
    :effect (and (attending dorothy ?t) (not (free dorothy ?t)))
  )

  (:action attend-rebecca
    :parameters (?t - time)
    :precondition (free rebecca ?t)
    :effect (and (attending rebecca ?t) (not (free rebecca ?t)))
  )

  (:action attend-jordan
    :parameters (?t - time)
    :precondition (free jordan ?t)
    :effect (and (attending jordan ?t) (not (free jordan ?t)))
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