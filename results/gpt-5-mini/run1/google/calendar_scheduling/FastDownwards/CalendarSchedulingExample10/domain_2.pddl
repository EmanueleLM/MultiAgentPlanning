(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (free ?p - participant ?s - slot)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )

  ;; Schedule a single 30-minute meeting at a chosen start slot.
  ;; Preconditions: meeting not already scheduled and all required participants are free at that slot.
  ;; Effects: mark meeting scheduled, record the chosen slot, and remove the corresponding free facts.
  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (not (meeting-scheduled))
      (free diana ?s)
      (free ethan ?s)
      (free janet ?s)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
      (not (free diana ?s))
      (not (free ethan ?s))
      (not (free janet ?s))
    )
  )
)