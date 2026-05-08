(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:constants diana ethan janet - participant)
  (:predicates
    (free ?p - participant ?s - slot)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )

  ;; Schedule a single 30-minute meeting (one slot) only when all required participants are free.
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