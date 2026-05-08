(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :strips)
  (:types person slot)

  (:predicates
    (slot ?s - slot)
    (person ?p - person)

    ;; participant availability: true iff participant is available in that 30-min slot
    (available ?p - person ?s - slot)

    ;; scheduling bookkeeping
    (no-meeting-scheduled)                ; initially true, deleted when a meeting is scheduled
    (scheduled ?s - slot)                ; true for the chosen slot once scheduled
    (meeting-scheduled)                  ; global marker that a meeting was scheduled

    ;; records assignment of a participant to the scheduled slot
    (assigned ?p - person ?s - slot)

    ;; temporal ordering between discrete 30-minute slots (successor relation)
    (next ?s1 - slot ?s2 - slot)

    ;; soft preference marker (ANNOTATION / OPTIONAL): Zachary prefers slots before 14:00.
    ;; This predicate is not required in the main goal; see problem comments for optional preference.
    (preferred ?p - person ?s - slot)
  )

  ;; Single action that schedules a 30-minute meeting for three named participants at one slot.
  ;; Precondition requires all three participants be available in the same slot and no other meeting scheduled.
  ;; Effect records the scheduled slot and assigns each participant to that slot; prevents further scheduling.
  (:action schedule-meeting
    :parameters (?s - slot ?h - person ?n - person ?z - person)
    :precondition (and
      (slot ?s)
      (person ?h) (person ?n) (person ?z)
      (no-meeting-scheduled)
      (available ?h ?s)
      (available ?n ?s)
      (available ?z ?s)
    )
    :effect (and
      (not (no-meeting-scheduled))
      (scheduled ?s)
      (meeting-scheduled)
      (assigned ?h ?s)
      (assigned ?n ?s)
      (assigned ?z ?s)
    )
  )
)