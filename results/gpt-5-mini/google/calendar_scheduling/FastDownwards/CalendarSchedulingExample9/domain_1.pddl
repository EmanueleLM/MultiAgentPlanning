(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:predicates
    ;; participant is busy at a slot (cannot attend)
    (busy ?p - participant ?s - slot)

    ;; participant approved this slot for the meeting
    (approved ?p - participant ?s - slot)

    ;; meeting flags
    (meeting-scheduled)
    (scheduled-at ?s - slot)
    (scheduled-in-common)
  )

  ;; Diane's approval action (only if Diane is free at the slot)
  (:action approve-diane
    :parameters (?s - slot)
    :precondition (and
      (not (busy diane ?s))
      (not (meeting-scheduled))
      (not (approved diane ?s))
    )
    :effect (and
      (approved diane ?s)
    )
  )

  ;; Kelly's approval action (only if Kelly is free at the slot)
  (:action approve-kelly
    :parameters (?s - slot)
    :precondition (and
      (not (busy kelly ?s))
      (not (meeting-scheduled))
      (not (approved kelly ?s))
    )
    :effect (and
      (approved kelly ?s)
    )
  )

  ;; Deborah's approval action (only if Deborah is free at the slot)
  (:action approve-deborah
    :parameters (?s - slot)
    :precondition (and
      (not (busy deborah ?s))
      (not (meeting-scheduled))
      (not (approved deborah ?s))
    )
    :effect (and
      (approved deborah ?s)
    )
  )

  ;; Orchestrator confirms the meeting at a slot only when all three
  ;; participants have approved that same slot and no meeting exists yet.
  (:action confirm-orchestrator
    :parameters (?s - slot)
    :precondition (and
      (approved diane ?s)
      (approved kelly ?s)
      (approved deborah ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
      (scheduled-in-common)
    )
  )
)