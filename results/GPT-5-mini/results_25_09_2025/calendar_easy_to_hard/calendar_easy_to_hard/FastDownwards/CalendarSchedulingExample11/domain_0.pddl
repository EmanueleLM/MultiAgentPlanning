(define (domain meeting-scheduling)
  (:requirements :typing)
  (:types person time)
  (:constants alexander elizabeth walter - person)

  (:predicates
    (free ?p - person ?t - time)      ; person ?p is free at time ?t (30-min slot)
    (scheduled)                       ; a meeting has been scheduled
    (meeting-at ?t - time)            ; meeting is scheduled at time ?t
  )

  ;; Alexander can schedule a meeting at ?t if everyone is free then
  (:action schedule-by-alexander
    :parameters (?t - time)
    :precondition (and
      (free alexander ?t)
      (free elizabeth ?t)
      (free walter ?t)
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (meeting-at ?t)
    )
  )

  ;; Elizabeth can schedule a meeting at ?t if everyone is free then
  (:action schedule-by-elizabeth
    :parameters (?t - time)
    :precondition (and
      (free alexander ?t)
      (free elizabeth ?t)
      (free walter ?t)
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (meeting-at ?t)
    )
  )

  ;; Walter can schedule a meeting at ?t if everyone is free then
  (:action schedule-by-walter
    :parameters (?t - time)
    :precondition (and
      (free alexander ?t)
      (free elizabeth ?t)
      (free walter ?t)
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (meeting-at ?t)
    )
  )
)