(define (domain scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person slot)
  (:predicates
    (available ?p - person ?s - slot)
    (slot-free ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
  )

  ;; Schedule the meeting at a single slot (30-minute granularity).
  ;; Preconditions require that the chosen slot is free and all four participants are available.
  (:action schedule-at
    :parameters (?s - slot)
    :precondition (and
      (slot-free ?s)
      (available madison ?s)
      (available linda ?s)
      (available logan ?s)
      (available virginia ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (scheduled ?s)
      (not (slot-free ?s))
      (meeting-scheduled)
    )
  )
)