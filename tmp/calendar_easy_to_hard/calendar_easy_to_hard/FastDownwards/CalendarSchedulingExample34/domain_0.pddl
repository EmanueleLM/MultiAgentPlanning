(define (domain orchestrator-meeting)
  (:requirements :typing :negative-preconditions)
  (:types participant time)

  (:predicates
    ; time/slot predicates
    (slot ?t - time)
    (work-time ?t - time)
    (day-monday ?t - time)

    ; scheduling state
    (meeting-scheduled)
    (scheduled-at ?t - time)
    (meeting-confirmed)

    ; availability predicates (different agents used different names; keep them so each agent-action can use its original style)
    (free ?p - participant ?t - time)          ; used by Christine, Bobby, Bobby's domain
    (available ?p - participant ?t - time)     ; used by Janice, Elizabeth, Tyler
    (free-edward ?t - time)                    ; Edward's domain-specific predicate
  )

  ;; Christine's scheduling action (keeps Christine's original preconditions style)
  (:action schedule_christine
    :parameters (?t - time)
    :precondition (and
      (slot ?t)
      (work-time ?t)
      (day-monday ?t)
      (not (meeting-scheduled))
      (free christine ?t)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?t)
    )
  )

  ;; Janice's scheduling action (requires every participant be available at the time)
  (:action schedule_janice
    :parameters (?t - time)
    :precondition (and
      (not (meeting-scheduled))
      (available christine ?t)
      (available janice ?t)
      (available bobby ?t)
      (available elizabeth ?t)
      (available tyler ?t)
      (available edward ?t)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?t)
    )
  )

  ;; Bobby's scheduling action (uses 'free' predicate for every participant as in Bobby's domain)
  (:action schedule_bobby
    :parameters (?t - time)
    :precondition (and
      (slot ?t)
      (not (meeting-scheduled))
      (free christine ?t)
      (free janice ?t)
      (free bobby ?t)
      (free elizabeth ?t)
      (free tyler ?t)
      (free edward ?t)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?t)
    )
  )

  ;; Elizabeth's scheduling action (requires all participants available; expanded explicit conjunction)
  (:action schedule_elizabeth
    :parameters (?t - time)
    :precondition (and
      (slot ?t)
      (available christine ?t)
      (available janice ?t)
      (available bobby ?t)
      (available elizabeth ?t)
      (available tyler ?t)
      (available edward ?t)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?t)
    )
  )

  ;; Tyler's scheduling action (requires Tyler be available)
  (:action schedule_tyler
    :parameters (?t - time)
    :precondition (and
      (slot ?t)
      (not (meeting-scheduled))
      (available tyler ?t)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?t)
    )
  )

  ;; Edward's scheduling action (uses Edward-specific free-edward predicate)
  (:action schedule_edward
    :parameters (?t - time)
    :precondition (and
      (slot ?t)
      (free-edward ?t)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?t)
    )
  )

  ;; Confirm action: only succeeds if the scheduled time actually works for everyone.
  ;; This ensures the final goal requires a time acceptable to all participants.
  (:action confirm_meeting
    :parameters (?t - time)
    :precondition (and
      (scheduled-at ?t)
      (available christine ?t)
      (available janice ?t)
      (available bobby ?t)
      (available elizabeth ?t)
      (available tyler ?t)
      (available edward ?t)
    )
    :effect (meeting-confirmed)
  )
)