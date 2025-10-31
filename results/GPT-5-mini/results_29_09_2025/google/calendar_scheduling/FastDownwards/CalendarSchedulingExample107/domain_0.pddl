(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)     ; participant ?p is free at time slot ?s
    (meeting-at ?s - slot)           ; meeting is scheduled at slot ?s
    (unscheduled)                    ; no meeting scheduled yet
  )

  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (free peter ?s)
      (free judith ?s)
      (free keith ?s)
      (free evelyn ?s)
    )
    :effect (and
      (meeting-at ?s)
      (not (unscheduled))
    )
  )
)