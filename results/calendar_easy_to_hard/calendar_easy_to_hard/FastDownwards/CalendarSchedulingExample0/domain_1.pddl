(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person time)
  (:predicates
    (free ?p - person ?t - time)
    (adjacent ?t1 - time ?t2 - time)
    (attending-michelle ?t - time)
    (attending-steven ?t - time)
    (attending-jerry ?t - time)
    (meeting-at ?t - time)
    (meeting-scheduled)
  )

  (:action attend-michelle
    :parameters (?t - time ?t2 - time)
    :precondition (and (adjacent ?t ?t2) (free mic ?t) (free mic ?t2))
    :effect (and (attending-michelle ?t) (attending-michelle ?t2) (not (free mic ?t)) (not (free mic ?t2)))
  )

  (:action attend-steven
    :parameters (?t - time ?t2 - time)
    :precondition (and (adjacent ?t ?t2) (free steven ?t) (free steven ?t2))
    :effect (and (attending-steven ?t) (attending-steven ?t2) (not (free steven ?t)) (not (free steven ?t2)))
  )

  (:action attend-jerry
    :parameters (?t - time ?t2 - time)
    :precondition (and (adjacent ?t ?t2) (free jerry ?t) (free jerry ?t2))
    :effect (and (attending-jerry ?t) (attending-jerry ?t2) (not (free jerry ?t)) (not (free jerry ?t2)))
  )

  (:action finalize-meeting
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (adjacent ?t ?t2)
      (attending-michelle ?t) (attending-michelle ?t2)
      (attending-steven ?t) (attending-steven ?t2)
      (attending-jerry ?t) (attending-jerry ?t2)
    )
    :effect (and (meeting-at ?t) (meeting-scheduled))
  )
)