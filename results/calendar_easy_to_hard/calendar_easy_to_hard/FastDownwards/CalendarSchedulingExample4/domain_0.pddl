(define (domain multi-agent-scheduling)
  (:requirements :typing)
  (:types agent time)
  (:predicates
    (free ?a - agent ?t - time)
    (accepted-donna ?t - time)
    (accepted-john ?t - time)
    (accepted-billy ?t - time)
    (meeting-scheduled ?t - time)
  )

  (:action donna-accept
    :parameters (?t - time)
    :precondition (free donna ?t)
    :effect (accepted-donna ?t)
  )

  (:action john-accept
    :parameters (?t - time)
    :precondition (free john ?t)
    :effect (accepted-john ?t)
  )

  (:action billy-accept
    :parameters (?t - time)
    :precondition (free billy ?t)
    :effect (accepted-billy ?t)
  )

  (:action finalize-meeting
    :parameters (?t - time)
    :precondition (and (accepted-donna ?t) (accepted-john ?t) (accepted-billy ?t))
    :effect (meeting-scheduled ?t)
  )
)