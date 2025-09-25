(define (domain meeting-scheduling)
  (:requirements :strips :negative-preconditions :typing)
  (:types agent slot)
  (:predicates
    (agent ?a - agent)
    (slot ?s - slot)
    (free ?a - agent ?s - slot)
    (scheduled)            ; global flag that meeting is scheduled
    (meeting-at ?s - slot)
  )

  ;; Single global scheduling action that schedules the meeting at a slot
  ;; Preconditions require that all participants are free at that slot and
  ;; the meeting is not already scheduled.
  (:action schedule-at
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (not (scheduled))
      (free jesse ?s)
      (free kathryn ?s)
      (free megan ?s)
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
    )
  )
)