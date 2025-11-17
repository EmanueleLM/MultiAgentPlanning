(define (domain calendar-meeting-ordered-slots-audited)
  (:requirements :strips :typing)
  (:types
    participant slot
  )
  (:constants
    bobby scott kimberly - participant
  )
  (:predicates
    (free ?p - participant ?s - slot)
    (slot60 ?s - slot)
    (within-work ?s - slot)
    (allowed ?s - slot)
    (cursor ?s - slot)
    (chosen ?s - slot)
    (scheduled)
    (unscheduled)
  )

  (:action choose-slot
    :parameters (?s - slot)
    :precondition (and
      (cursor ?s)
      (allowed ?s)
      (slot60 ?s)
      (within-work ?s)
      (free bobby ?s)
      (free scott ?s)
      (free kimberly ?s)
      (unscheduled)
    )
    :effect (and
      (scheduled)
      (chosen ?s)
      (not (unscheduled))
    )
  )
)