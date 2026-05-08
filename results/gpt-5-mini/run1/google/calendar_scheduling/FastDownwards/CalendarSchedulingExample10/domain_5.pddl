(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  ;; Declare the three participants as domain constants to allow action schemas
  ;; to reference them directly without repeating them in the problem objects.
  (:constants diana ethan janet - participant)

  (:predicates
    (free ?p - participant ?s - slot)    ;; participant ?p is free at slot ?s
    (meeting-scheduled)                  ;; a meeting has been scheduled
    (scheduled-at ?s - slot)             ;; meeting is scheduled at slot ?s
  )

  ;; Schedule a single 30-minute meeting at one slot when all required participants are free.
  (:action schedule_meeting_at
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