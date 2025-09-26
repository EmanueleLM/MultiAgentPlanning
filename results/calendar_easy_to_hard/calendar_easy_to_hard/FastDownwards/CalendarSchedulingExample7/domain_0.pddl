(define (domain meeting-scheduling)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (slot ?s)
    (next ?s ?s2)                 ; temporal ordering of slots
    (ready ?s)                    ; this slot is next to test/schedule
    (checked ?s)                  ; this slot was checked and skipped
    (busy ?p ?s)                  ; person p is busy during slot s
    (scheduled ?s)                ; meeting scheduled at slot s
    (meeting-scheduled)           ; a meeting has been scheduled
    (person ?p)
  )

  ; Schedule action: applicable only when this slot is the current ready slot
  ; and no participant is busy at that slot. This enforces scheduling at the
  ; first ready (earliest unchecked) feasible slot.
  (:action schedule
    :parameters (?s)
    :precondition (and
      (ready ?s)
      (not (busy heather ?s))
      (not (busy nicholas ?s))
      (not (busy zachary ?s))
    )
    :effect (and
      (scheduled ?s)
      (meeting-scheduled)
      (not (ready ?s))
    )
  )

  ; If the current ready slot is blocked for heather, mark it checked and advance.
  (:action fail-heather
    :parameters (?s ?next)
    :precondition (and
      (ready ?s)
      (next ?s ?next)
      (busy heather ?s)
    )
    :effect (and
      (checked ?s)
      (not (ready ?s))
      (ready ?next)
    )
  )

  ; If the current ready slot is blocked for nicholas, mark it checked and advance.
  (:action fail-nicholas
    :parameters (?s ?next)
    :precondition (and
      (ready ?s)
      (next ?s ?next)
      (busy nicholas ?s)
    )
    :effect (and
      (checked ?s)
      (not (ready ?s))
      (ready ?next)
    )
  )

  ; If the current ready slot is blocked for zachary, mark it checked and advance.
  (:action fail-zachary
    :parameters (?s ?next)
    :precondition (and
      (ready ?s)
      (next ?s ?next)
      (busy zachary ?s)
    )
    :effect (and
      (checked ?s)
      (not (ready ?s))
      (ready ?next)
    )
  )
)