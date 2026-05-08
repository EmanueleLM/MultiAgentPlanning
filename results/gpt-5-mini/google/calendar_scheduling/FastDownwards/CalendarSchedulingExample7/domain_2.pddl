(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :strips)
  (:types person slot)

  (:predicates
    ;; participant availability: true iff participant is available in that 30-min slot
    (available ?p - person ?s - slot)

    ;; scheduling bookkeeping
    (no-meeting-scheduled)                ; initially true, deleted when a meeting is scheduled
    (scheduled ?s - slot)                ; true for the chosen slot once scheduled
    (meeting-scheduled)                  ; global marker that a meeting was scheduled

    ;; records assignment of a participant to the scheduled slot
    (assigned ?p - person ?s - slot)

    ;; (optional/annotative) marker that a slot is preferred by a participant
    (preferred ?p - person ?s - slot)
  )

  ;; Action that schedules the 30-minute meeting for the specific participants
  ;; (heather, nicholas, zachary) at a chosen slot.
  ;; Precondition requires all three named participants be available in the same slot
  ;; and that no other meeting has been scheduled yet.
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (no-meeting-scheduled)
      (available heather ?s)
      (available nicholas ?s)
      (available zachary ?s)
    )
    :effect (and
      (not (no-meeting-scheduled))
      (scheduled ?s)
      (meeting-scheduled)
      (assigned heather ?s)
      (assigned nicholas ?s)
      (assigned zachary ?s)
    )
  )
)