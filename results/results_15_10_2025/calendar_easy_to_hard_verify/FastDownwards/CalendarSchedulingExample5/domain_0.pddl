(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (slot ?s - slot)
    (person ?p - person)
    (free ?p - person ?s - slot)      ; participant ?p is free at slot ?s (30-min slot start)
    (allowed-start ?s - slot)         ; slot ?s is an allowed meeting start (enforces Charlotte's cutoff)
    (scheduled)                       ; a meeting has been scheduled
    (meeting-at ?s - slot)            ; meeting is scheduled at slot ?s
  )

  ;; Schedule a single 30-minute meeting at a chosen slot.
  ;; Preconditions require all participants to be free at that slot,
  ;; and that the slot is allowed by the explicit temporal constraint (Charlotte's cutoff).
  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (free kathryn ?s)
      (free charlotte ?s)
      (free lauren ?s)
      (allowed-start ?s)
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
    )
  )
)