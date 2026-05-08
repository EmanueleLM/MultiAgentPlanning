(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (free ?p - participant ?s - slot)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )

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
    )
  )
)