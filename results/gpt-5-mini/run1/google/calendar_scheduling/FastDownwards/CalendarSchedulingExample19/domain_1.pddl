(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:predicates
    (free ?p - participant ?s - slot)     ; participant ?p is free during half-hour slot ?s
    (next ?s1 - slot ?s2 - slot)          ; temporal successor (30-min step)
    (meeting_scheduled)                   ; meeting has been scheduled
    (scheduled_at ?s - slot)              ; meeting starts at slot ?s (occupies ?s and its successor)
  )

  ;; Schedule a 60-minute meeting by selecting a half-hour slot and its immediate successor.
  ;; Preconditions explicitly require that all listed participants are free in both slots.
  (:action schedule
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (next ?s ?s2)
      (not (meeting_scheduled))
      (free stephen ?s) (free stephen ?s2)
      (free edward  ?s) (free edward  ?s2)
      (free angela  ?s) (free angela  ?s2)
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?s)
    )
  )
)