(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:predicates
    ;; domain objects
    (participant ?p - participant)
    (slot ?s - slot)

    ;; constraints / state
    (busy ?p - participant ?s - slot)        ;; participant is busy at slot (cannot attend)
    (approved ?p - participant ?s - slot)    ;; participant approved this slot
    (meeting-scheduled)                      ;; meeting has been scheduled (terminal flag)
    (scheduled-at ?s - slot)                 ;; meeting scheduled at this slot
    (scheduled-in-common)                    ;; meeting scheduled at a slot that is common-free
  )

  ;; Each participant has their own explicit approval action.
  ;; Approval is only possible if the participant is not busy at the slot
  ;; and the meeting has not already been scheduled.
  (:action approve-diane
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (participant diane)
      (not (busy diane ?s))
      (not (meeting-scheduled))
      (not (approved diane ?s))
    )
    :effect (and
      (approved diane ?s)
    )
  )

  (:action approve-kelly
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (participant kelly)
      (not (busy kelly ?s))
      (not (meeting-scheduled))
      (not (approved kelly ?s))
    )
    :effect (and
      (approved kelly ?s)
    )
  )

  (:action approve-deborah
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (participant deborah)
      (not (busy deborah ?s))
      (not (meeting-scheduled))
      (not (approved deborah ?s))
    )
    :effect (and
      (approved deborah ?s)
    )
  )

  ;; Orchestrator action: can only confirm a meeting for a slot when all three participants
  ;; have approved the same slot, and no meeting has yet been scheduled.
  ;; When executed this action sets the schedule flags (meeting-scheduled and scheduled-at).
  ;; scheduled-in-common is set as a terminal marker required by the goal (it is only reachable
  ;; if all three approvals were on the same slot, which enforces agreement).
  (:action confirm-orchestrator
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
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