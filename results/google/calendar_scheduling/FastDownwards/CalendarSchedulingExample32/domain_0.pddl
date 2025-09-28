(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)    ; participant ?p is free at slot ?s
    (feasible ?s - slot)           ; slot ?s is feasible for scheduling (precomputed)
    (scheduled ?s - slot)
    (meeting-scheduled)
  )

  ; Single generic scheduling action: can schedule at any precomputed feasible slot.
  (:action schedule-at
    :parameters (?s - slot)
    :precondition (and (feasible ?s))
    :effect (and (scheduled ?s) (meeting-scheduled))
  )
)