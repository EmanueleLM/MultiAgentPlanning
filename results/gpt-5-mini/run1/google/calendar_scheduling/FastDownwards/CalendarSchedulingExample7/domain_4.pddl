(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :strips)
  (:types person slot)

  (:predicates
    ;; participant availability: true iff participant is available in that 30-min slot
    (available ?p - person ?s - slot)

    ;; scheduling bookkeeping: only one meeting allowed in this instance
    (no-meeting-scheduled)
    (scheduled ?s - slot)
    (meeting-scheduled)

    ;; records assignment of a participant to the scheduled slot
    (assigned ?p - person ?s - slot)

    ;; annotative marker that a slot is preferred by a participant (soft preference)
    (preferred ?p - person ?s - slot)
  )

  ;; schedule the 30-minute meeting for the participants at a chosen slot.
  ;; requires that no meeting has been scheduled and that all participants are available.
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