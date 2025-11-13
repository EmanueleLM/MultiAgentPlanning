(define (domain meeting-scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot day)
  (:predicates
    (slot ?s - slot)
    (participant ?p - participant)
    (day ?d - day)
    (slot-of-day ?s - slot ?d - day)
    (available ?p - participant ?s - slot)
    (audited ?s - slot)          ; marks the single audited (allowed) slot
    (scheduled)                  ; global flag meaning "a meeting has been scheduled"
  )

  (:action schedule-slot
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (audited ?s)               ; only audited (allowed) slot may be scheduled
      (not (scheduled))          ; allow scheduling exactly once
      ; require all three participants be available for the chosen slot
      (available Joyce ?s)
      (available Christine ?s)
      (available Alexander ?s)
    )
    :effect (and
      (scheduled)
      ; consume the per-participant availability for that slot (reflecting the meeting)
      (not (available Joyce ?s))
      (not (available Christine ?s))
      (not (available Alexander ?s))
    )
  )
)