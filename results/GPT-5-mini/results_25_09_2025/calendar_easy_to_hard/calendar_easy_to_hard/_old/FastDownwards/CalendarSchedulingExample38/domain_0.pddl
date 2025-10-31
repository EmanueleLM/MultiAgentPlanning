(define (domain unified-meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types slot person)

  (:predicates
    ;; structural
    (within ?s - slot)                   ; slot is within work hours (09:00-17:00)

    ;; per-agent availability (keeps each agent's constraints distinct & traceable)
    (available ?p - person ?s - slot)    ; person ?p is available at slot ?s

    ;; meeting bookkeeping
    (meeting-scheduled)                  ; true once a meeting has been scheduled
    (meeting-at ?s - slot)               ; meeting chosen at slot ?s
    (includes-all-participants)          ; indicates the scheduled meeting includes all participants
  )

  ;; Schedule action: choose one 30-minute slot that is within work hours and is available
  ;; for every participant. The action is disabled if a meeting is already scheduled.
  ;; Effects record the scheduled meeting and that it includes all participants.
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (within ?s)
      (not (meeting-scheduled))
      ;; availability preconditions: explicitly require availability for each participant
      (available adam ?s)
      (available frances ?s)
      (available natalie ?s)
      (available patrick ?s)
      (available willie ?s)
      (available diana ?s)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (includes-all-participants)
    )
  )
)