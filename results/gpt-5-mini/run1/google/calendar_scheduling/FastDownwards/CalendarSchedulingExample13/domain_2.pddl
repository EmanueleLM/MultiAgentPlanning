(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types slot)

  (:predicates
    ;; per-participant availability at slot start times (30-minute meeting)
    (available_gerald ?s - slot)
    (available_roy ?s - slot)
    (available_barbara ?s - slot)

    ;; preference modeling: which slots are considered "preferred" (>= 13:00)
    (preferred_slot ?s - slot)
    ;; global flag set by the orchestrator/auditor indicating whether
    ;; there exists at least one preferred slot that is available to all participants
    (preferred_available)

    ;; meeting result predicates
    (meeting_scheduled)
    (scheduled_at ?s - slot)
  )

  ;; Action used when a preferred slot is available.
  ;; This enforces Gerald's soft preference structurally: if a preferred slot
  ;; is available to everyone, only the preferred scheduling action is allowed.
  (:action schedule_preferred
    :parameters (?s - slot)
    :precondition (and
      (preferred_slot ?s)
      (available_gerald ?s)
      (available_roy ?s)
      (available_barbara ?s)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?s)
    )
  )

  ;; Fallback action used only when no preferred slot is available to all participants.
  (:action schedule_any
    :parameters (?s - slot)
    :precondition (and
      (available_gerald ?s)
      (available_roy ?s)
      (available_barbara ?s)
      (not (preferred_available))   ;; only allowed when no preferred slot works for everyone
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?s)
    )
  )
)