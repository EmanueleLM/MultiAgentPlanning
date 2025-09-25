(define (domain orchestrator-domain)
  (:requirements :typing)
  (:types time)

  (:predicates
    (next ?t ?t2 - time)            ; successive half-hour ticks
    (valid-start ?t - time)         ; allowed meeting start times (meeting fits work hours)
    (free-billy ?t - time)
    (free-maria ?t - time)
    (free-william ?t - time)
    (billy-ok ?t - time)
    (maria-ok ?t - time)
    (william-ok ?t - time)
    (scheduled)
    (scheduled-at ?t - time)
  )

  ;; Billy's approval action (distinct agent action)
  (:action billy-approve
    :parameters (?t ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (valid-start ?t)
      (free-billy ?t)
      (free-billy ?t2)
    )
    :effect (billy-ok ?t)
  )

  ;; Maria's approval action (distinct agent action)
  (:action maria-approve
    :parameters (?t ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (valid-start ?t)
      (free-maria ?t)
      (free-maria ?t2)
    )
    :effect (maria-ok ?t)
  )

  ;; William's approval action (distinct agent action)
  (:action william-approve
    :parameters (?t ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (valid-start ?t)
      (free-william ?t)
      (free-william ?t2)
    )
    :effect (william-ok ?t)
  )

  ;; Orchestrator schedules the meeting once all agents approve the same start time
  (:action schedule-meeting
    :parameters (?t - time)
    :precondition (and
      (valid-start ?t)
      (billy-ok ?t)
      (maria-ok ?t)
      (william-ok ?t)
    )
    :effect (and
      (scheduled)
      (scheduled-at ?t)
    )
  )

)