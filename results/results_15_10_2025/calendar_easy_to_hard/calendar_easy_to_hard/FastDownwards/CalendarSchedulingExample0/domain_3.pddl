(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person time)
  (:constants mic steven jerry - person)
  (:predicates
    (free ?p - person ?t - time)
    (adjacent ?t1 - time ?t2 - time)
    (attending ?p - person ?t - time)
    (meeting-at ?t - time)
    (meeting-scheduled)
  )

  (:action attend-mic
    :parameters (?t - time ?t2 - time)
    :precondition (and (adjacent ?t ?t2) (free mic ?t) (free mic ?t2))
    :effect (and (attending mic ?t) (attending mic ?t2) (not (free mic ?t)) (not (free mic ?t2)))
  )

  (:action attend-steven
    :parameters (?t - time ?t2 - time)
    :precondition (and (adjacent ?t ?t2) (free steven ?t) (free steven ?t2))
    :effect (and (attending steven ?t) (attending steven ?t2) (not (free steven ?t)) (not (free steven ?t2)))
  )

  (:action attend-jerry
    :parameters (?t - time ?t2 - time)
    :precondition (and (adjacent ?t ?t2) (free jerry ?t) (free jerry ?t2))
    :effect (and (attending jerry ?t) (attending jerry ?t2) (not (free jerry ?t)) (not (free jerry ?t2)))
  )

  (:action finalize-meeting
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (adjacent ?t ?t2)
      (attending mic ?t) (attending mic ?t2)
      (attending steven ?t) (attending steven ?t2)
      (attending jerry ?t) (attending jerry ?t2)
    )
    :effect (and (meeting-at ?t) (meeting-scheduled))
  )
)