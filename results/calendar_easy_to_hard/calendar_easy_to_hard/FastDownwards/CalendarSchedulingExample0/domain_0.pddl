(define (domain multi-agent-meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent time)

  (:predicates
    (busy ?a - agent ?t - time)            ; a is busy during the half-hour block starting at t
    (confirmed ?a - agent ?t - time)       ; a has confirmed a meeting starting at t (for 60 minutes: t and next t)
    (next ?t1 - time ?t2 - time)           ; t2 is the next half-hour after t1
    (meeting-finalized ?t - time)          ; meeting is finalized starting at t (60 minutes: t and next t)
  )

  ;; Each agent expresses their availability by confirming a start time.
  ;; The final action requires confirmation from all three distinct agents.
  (:action confirm-michelle
    :parameters (?t ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (not (busy michelle ?t))
      (not (busy michelle ?t2))
      (not (confirmed michelle ?t))
    )
    :effect (confirmed michelle ?t)
  )

  (:action confirm-steven
    :parameters (?t ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (not (busy steven ?t))
      (not (busy steven ?t2))
      (not (confirmed steven ?t))
    )
    :effect (confirmed steven ?t)
  )

  (:action confirm-jerry
    :parameters (?t ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (not (busy jerry ?t))
      (not (busy jerry ?t2))
      (not (confirmed jerry ?t))
    )
    :effect (confirmed jerry ?t)
  )

  (:action finalize-meeting
    :parameters (?t ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (confirmed michelle ?t)
      (confirmed steven ?t)
      (confirmed jerry ?t)
      (not (meeting-finalized ?t))
    )
    :effect (meeting-finalized ?t)
  )
)