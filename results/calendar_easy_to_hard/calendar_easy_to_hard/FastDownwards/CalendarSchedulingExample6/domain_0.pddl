(define (domain multiagent-meeting)
  (:requirements :typing :negative-preconditions)
  (:types agent time)

  (:predicates
    (scheduled)
    (meeting-start ?t - time)
    (free ?a - agent ?t - time)       ; free to start a 60-min meeting at time ?t
    (earliest ?t - time)
    (participant ?a - agent)
  )

  ;; Thomas proposes scheduling
  (:action propose-meeting-thomas
    :parameters (?t - time)
    :precondition (and
      (not (scheduled))
      (free thomas ?t)
      (free dylan ?t)
      (free jerry ?t)
      (earliest ?t)
    )
    :effect (and
      (scheduled)
      (meeting-start ?t)
    )
  )

  ;; Dylan proposes scheduling
  (:action propose-meeting-dylan
    :parameters (?t - time)
    :precondition (and
      (not (scheduled))
      (free thomas ?t)
      (free dylan ?t)
      (free jerry ?t)
      (earliest ?t)
    )
    :effect (and
      (scheduled)
      (meeting-start ?t)
    )
  )

  ;; Jerry proposes scheduling
  (:action propose-meeting-jerry
    :parameters (?t - time)
    :precondition (and
      (not (scheduled))
      (free thomas ?t)
      (free dylan ?t)
      (free jerry ?t)
      (earliest ?t)
    )
    :effect (and
      (scheduled)
      (meeting-start ?t)
    )
  )
)