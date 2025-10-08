(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (next ?s1 - slot ?s2 - slot)        ; consecutive half-hour slots
    (free ?p - participant ?s - slot)   ; participant p is free in half-slot s
    (unscheduled)                       ; no meeting scheduled yet
    (meeting-start ?s - slot)           ; meeting scheduled starting at slot s (half-hour)
  )

  (:action schedule
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (unscheduled)
      (next ?s ?s2)
      ; participant-specific availability checks (traceable)
      (free denise ?s) (free denise ?s2)
      (free joseph ?s) (free joseph ?s2)
      (free henry ?s) (free henry ?s2)
      (free christian ?s) (free christian ?s2)
    )
    :effect (and
      (not (unscheduled))
      (meeting-start ?s)
    )
  )
)